import 'dart:io';

import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/utils/attachment_selection_mixin.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/widgets/caption_text.dart';
import 'package:alufluoride/widgets/spaced_column.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

enum PhotoState { capture, view }

class PhotoSelectionWidget extends StatefulWidget {
  const PhotoSelectionWidget({
    super.key,
    this.title,
    this.isRequired = false,
    this.isReadOnly = false,
    this.imageUrl,
    this.defaultValue,
    required this.onFileCapture, 
    this.focusNode, 
    required this.fileName, 
    this.isWarning,  
    required this.borderColor,
  });

  final String? title;
  final String fileName;
  final bool isRequired;
  final String? imageUrl;
  final File? defaultValue;
  final Function(File? file) onFileCapture;
  final bool isReadOnly;
  final FocusNode? focusNode;
  final bool? isWarning;
  final Color borderColor;

  @override
  State<PhotoSelectionWidget> createState() => _PhotoSelectionWidgetState();
}

class _PhotoSelectionWidgetState extends State<PhotoSelectionWidget>
    with AttahcmentSelectionMixin {
  File? _selectedImage;
  PhotoState _photoState = PhotoState.capture;

  @override
  void initState() {
    super.initState();
    if (widget.defaultValue.isNotNull) {
      _selectedImage = widget.defaultValue;
      _photoState = PhotoState.view;
    }
    if (widget.imageUrl.isNotNull) {
      _selectedImage = null;
      _photoState = PhotoState.view;
    }
  }

  Future<void> _capture() async {
    final capturedFile = await captureImage();
    if (capturedFile != null) {
      final directoryPath = capturedFile.parent.path;
      final exten = path.extension(capturedFile.path);
      final newFileName = '${widget.fileName}$exten';
      final newPath = path.join(directoryPath, newFileName);
      final renamedFile = await capturedFile.rename(newPath);
      setState(() {
        _selectedImage = renamedFile;
        _photoState = PhotoState.view;
      });
      widget.onFileCapture(renamedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SpacedColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      defaultHeight: 4,
      margin: EdgeInsets.zero,
      children: [
        if (widget.title.containsValidValue) ...[
          CaptionText(
              title: widget.title.valueOrEmpty, isRequired: widget.isRequired),
        ],
        GestureDetector(
          onTap: _photoState == PhotoState.view
            ? () => context.goToPage(ImagePreviewPage(
                title: widget.title.valueOrEmpty,
                imageUrl: widget.imageUrl,
                image: _selectedImage,
              ))
            : null,
          child: Focus(
            focusNode: widget.focusNode,
            child: Container(
              height: 48,
              width: context.sizeOfWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: widget.borderColor, width: 1),
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color: widget.borderColor,
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_photoState == PhotoState.capture)
                    Center(
                      child: IconButton(
                        onPressed: widget.isReadOnly 
                          ? null 
                          : () async => await _capture(),
                        icon: Icon(widget.isWarning == true 
                          ? Icons.warning_amber_outlined :
                            Icons.add_a_photo, size: 24, 
                              color: widget.isReadOnly ? AppColors.grey : widget.borderColor,
                          ),
                      ),
                    )
                  else if (_photoState == PhotoState.view)
                    const Center(
                      child: Text(
                        'View',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: AppColors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if(_photoState == PhotoState.view && !widget.isReadOnly)...[
                    Positioned(
                      right: 8.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.himlayaPeeks,
                        ),
                        onPressed: _capture,
                        child: Text('RETAKE', 
                          style: context.textTheme.labelLarge?.copyWith(
                            color: AppColors.vibrantBlue,
                            fontWeight: FontWeight.bold,
                            decorationStyle: TextDecorationStyle.dashed
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ImagePreviewPage extends StatelessWidget {
  final String title;
  final File? image;
  final String? imageUrl;

  const ImagePreviewPage({
    super.key,
    required this.image,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          if (image != null) ...[
            SizedBox(
              height: 400,
              width: context.sizeOfWidth,
              child: Card(
                shape: Border.all(color: AppColors.green),
                child: Image.file(
                  image!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ] else if (imageUrl != null && imageUrl!.isNotEmpty) ...[
            SizedBox(
              height: 400,
              width: context.sizeOfWidth,
              child: Card(
                shape: Border.all(color: AppColors.green),
                child: Image.network(
                  Uri.encodeFull(Urls.filepath(imageUrl!)),
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.haintBlue,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, color: Colors.red);
                  },
                ),
              ),
            ),
          ] else ...[
            const Center(
              child: Text(
                'No Image Available',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
