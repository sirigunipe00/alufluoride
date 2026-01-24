import 'dart:io';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/utils/attachment_selection_mixin.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/widgets/caption_text.dart';
import 'package:alufluoride/widgets/inputs/photo_selection_widget.dart';
import 'package:alufluoride/widgets/spaced_column.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum PhotoState { capture, view }

class WeightmentPhotoWidget extends StatefulWidget {
  const WeightmentPhotoWidget({
    super.key,
    this.title,
    this.subTitle,
    this.isRequired = false,
    this.isReadOnly = false,
    this.isLoading = false,
    this.imageUrl,
    this.defaultValue,
    required this.onFileCapture,
    this.focusNode,
    required this.fileName,
    this.isWarning,
    required this.borderColor,
    this.onTextExtracted,
  });

  final String? title;
  final String? subTitle;
  final String fileName;
  final bool isRequired;
  final bool isLoading;
  final String? imageUrl;
  final File? defaultValue;
  final Function(File? file) onFileCapture;
  final Function(String text)? onTextExtracted;
  final bool isReadOnly;
  final FocusNode? focusNode;
  final bool? isWarning;
  final Color borderColor;

  @override
  State<WeightmentPhotoWidget> createState() => _WeightmentPhotoWidgetState();
}

class _WeightmentPhotoWidgetState extends State<WeightmentPhotoWidget>
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
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 95,
      );
      if (pickedFile != null) {
        final selectedImage = File(pickedFile.path);

        setState(() {
          _selectedImage = selectedImage;
          _photoState = PhotoState.view;
        });

        widget.onFileCapture(selectedImage);
      }
    } catch (e) {
      debugPrint('❌ Error while picking image: $e');
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
            title: widget.title.valueOrEmpty,
            isRequired: widget.isRequired,
          ),
        ],
        GestureDetector(
          onTap: _photoState == PhotoState.view
              ? () => context.goToPage(
                    ImagePreviewPage(
                      title: widget.title.valueOrEmpty,
                      imageUrl: widget.imageUrl,
                      image: _selectedImage,
                    ),
                  )
              : null,
          child: Focus(
            focusNode: widget.focusNode,
            child: Container(
              height: 60,
              width: context.sizeOfWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: widget.borderColor, width: 1),
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                  BoxShadow(
                    color: widget.borderColor.withOpacity(0.3),
                    blurRadius: 2,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (widget.isLoading)
                    const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          SizedBox(width: 12),
                          Text("Extracting Weight...",
                              style: TextStyle(
                                  color: AppColors.grey, fontSize: 13)),
                        ],
                      ),
                    )
                  else if (_photoState == PhotoState.capture)
                    Center(
                      child: IconButton(
                        onPressed: widget.isReadOnly ? null : _capture,
                        icon: Icon(
                          widget.isWarning == true
                              ? Icons.warning_amber_outlined
                              : Icons.add_a_photo,
                          size: 24,
                          color: widget.isReadOnly
                              ? AppColors.grey
                              : widget.borderColor,
                        ),
                      ),
                    )
                  else if (_photoState == PhotoState.view)
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 80.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'View Photo',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (widget.subTitle != null)
                            Text(
                              widget.subTitle!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.vibrantBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      ),
                    ),
                  if (_photoState == PhotoState.view &&
                      !widget.isReadOnly &&
                      !widget.isLoading)
                    Positioned(
                      right: 8.0,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.himlayaPeeks,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        onPressed: _capture,
                        child: const Text(
                          'RETAKE',
                          style: TextStyle(
                            color: AppColors.vibrantBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
