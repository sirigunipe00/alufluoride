import 'dart:async';
import 'dart:io';

import 'package:alufluoride/features/production_baggging_entry/presentation/ui/widget/live_capture_validator.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/ui/widget/weighment_camera_overlay.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';


class WeighmentLiveCameraPage extends StatefulWidget {
  const WeighmentLiveCameraPage({
    super.key,
    this.title = 'Capture Weighment',
  });

  final String title;


  static Future<File?> open(
    BuildContext context, {
    String title = 'Capture Weighment',
  }) {
    return Navigator.of(context).push<File>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => WeighmentLiveCameraPage(title: title),
      ),
    );
  }

  @override
  State<WeighmentLiveCameraPage> createState() =>
      _WeighmentLiveCameraPageState();
}

class _WeighmentLiveCameraPageState extends State<WeighmentLiveCameraPage>
    with WidgetsBindingObserver {
  CameraController? _controller;
  String? _error;
  bool _isInitializing = true;
  bool _isCapturing = false;
  bool _isValidating = false;
  bool _torchLockedOn = false;
  bool _shutterEnabled = false;
  Timer? _torchWarmupTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // SpeedAC display is landscape — lock capture UI + ROI boxes horizontally.
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _initCamera();
  }

  @override
  void dispose() {
    _torchWarmupTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    _disposeCamera();
    // Restore app orientation after leaving capture.
    SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) return;

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {

      _disposeCamera();
    } else if (state == AppLifecycleState.resumed) {
      _initCamera();
    }
  }

  Future<void> _disposeCamera() async {
    _torchWarmupTimer?.cancel();
    _shutterEnabled = false;
    final c = _controller;
    _controller = null;
    _torchLockedOn = false;
    if (c != null) {
      try {
        if (c.value.isInitialized) {
          await c.setFlashMode(FlashMode.off);
        }
      } catch (_) {}
      await c.dispose();
    }
  }

  Future<void> _initCamera() async {
    setState(() {
      _isInitializing = true;
      _error = null;
    });

    final status = await Permission.camera.request();
    if (!status.isGranted) {
      if (!mounted) return;
      setState(() {
        _isInitializing = false;
        _error =
            'Camera permission is required to capture a live weighment photo.';
      });
      return;
    }

    try {
      final cameras = await availableCameras();
      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        back,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await controller.initialize();

      await controller.setFlashMode(FlashMode.torch);

      if (!mounted) {
        await controller.dispose();
        return;
      }

      setState(() {
        _controller = controller;
        _torchLockedOn = true;
        _isInitializing = false;
        _shutterEnabled = false;
      });


      unawaited(_ensureTorchOn());

      _torchWarmupTimer?.cancel();
      _torchWarmupTimer = Timer(const Duration(milliseconds: 800), () {
        if (mounted) setState(() => _shutterEnabled = true);
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isInitializing = false;
        _error = 'Unable to open camera: $e';
      });
    }
  }

  Future<void> _ensureTorchOn() async {
    final c = _controller;
    if (c == null || !c.value.isInitialized) return;
    try {
      await c.setFlashMode(FlashMode.torch);
      if (mounted) setState(() => _torchLockedOn = true);
    } catch (_) {
      // Some emulators lack torch; keep capture usable.
      if (mounted) setState(() => _torchLockedOn = false);
    }
  }

  Future<void> _onCapturePressed() async {
    final controller = _controller;
    if (controller == null ||
        !controller.value.isInitialized ||
        !_shutterEnabled ||
        _isCapturing ||
        _isValidating) {
      return;
    }

    setState(() => _isCapturing = true);

    try {
      await _ensureTorchOn();
      final shot = await controller.takePicture();
      final file = File(shot.path);

      if (!mounted) return;
      setState(() {
        _isCapturing = false;
        _isValidating = true;
      });

      final result = await LiveCaptureValidator.validate(file);

      if (!mounted) return;
      setState(() => _isValidating = false);

      if (!result.isAccepted) {
        await file.delete().catchError((_) => file);
        if (!mounted) return;
        await showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: Colors.red),
                SizedBox(width: 10),
                Expanded(child: Text('Live capture required')),
              ],
            ),
            content: Text(
              result.rejectReason ??
                  'Please capture the live weighing machine display.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('RETRY'),
              ),
            ],
          ),
        );
        // Keep camera + torch running for retry.
        await _ensureTorchOn();
        return;
      }

      if (!mounted) return;
      Navigator.of(context).pop(file);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isCapturing = false;
        _isValidating = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Capture failed: $e')),
      );
      await _ensureTorchOn();
    }
  }

  Future<bool> _onWillPop() async {
    if (_isCapturing || _isValidating) return false;
    final leave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cancel capture?'),
        content: const Text(
          'You must capture a live weighment photo from the weighing machine. '
          'Leave without capturing?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('STAY'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('LEAVE'),
          ),
        ],
      ),
    );
    return leave == true;
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final ready = controller != null && controller.value.isInitialized;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final ok = await _onWillPop();
        if (ok && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (_isInitializing)
                const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              else if (_error != null)
                _ErrorView(message: _error!, onRetry: _initCamera)
              else if (ready)
                _CameraPreviewArea(controller: controller),

              // Top bar — no flash toggle on purpose.
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  color: Colors.black54,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (_isCapturing || _isValidating)
                            ? null
                            : () async {
                                final ok = await _onWillPop();
                                if (ok && context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              },
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      // Torch status — locked ON, not tappable.
                      Chip(
                        avatar: Icon(
                          Icons.flashlight_on,
                          size: 16,
                          color: _torchLockedOn ? Colors.amber : Colors.white70,
                        ),
                        label: Text(
                          _torchLockedOn ? 'Torch ON' : 'No torch',
                          style: const TextStyle(fontSize: 12),
                        ),
                        backgroundColor: Colors.white12,
                        labelStyle: const TextStyle(color: Colors.white),
                        side: BorderSide.none,
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                ),
              ),

              if (ready)
                const Positioned.fill(
                  child: WeighmentCameraOverlay(),
                ),

              // Bottom instructions + shutter (compact for landscape)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  color: Colors.black87,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Hold phone horizontally. Align the weighing machine '
                          'display inside the white boxes. Torch stays ON.',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 16),
                      if (_isValidating)
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Checking...',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      else
                        GestureDetector(
                          onTap: ready && _shutterEnabled && !_isCapturing
                              ? _onCapturePressed
                              : null,
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _shutterEnabled
                                    ? Colors.white
                                    : Colors.white38,
                                width: 4,
                              ),
                              color: _isCapturing
                                  ? Colors.white38
                                  : Colors.white24,
                            ),
                            child: _isCapturing
                                ? const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Icon(
                                    Icons.camera_alt,
                                    color: _shutterEnabled
                                        ? Colors.white
                                        : Colors.white38,
                                    size: 28,
                                  ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CameraPreviewArea extends StatelessWidget {
  const _CameraPreviewArea({required this.controller});

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final previewSize = controller.value.previewSize;
    if (previewSize == null) {
      return CameraPreview(controller);
    }

    // Cover the landscape screen while preserving camera aspect ratio.
    final screenAspect = size.width / size.height;
    final previewAspect = previewSize.height / previewSize.width;

    return ClipRect(
      child: OverflowBox(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: screenAspect > previewAspect
                ? size.width
                : size.height * previewAspect,
            height: screenAspect > previewAspect
                ? size.width / previewAspect
                : size.height,
            child: CameraPreview(controller),
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.videocam_off, color: Colors.white70, size: 48),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
            TextButton(
              onPressed: () => openAppSettings(),
              child: const Text('Open Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
