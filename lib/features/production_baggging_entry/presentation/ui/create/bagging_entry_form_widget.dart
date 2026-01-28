import 'dart:io';
import 'package:alufluoride/core/utils/date_format_util.dart';
import 'package:alufluoride/features/production_baggging_entry/model/item_model.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_bagging_entry_cubit/create_bagging_entry_cubit.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_weightment_cubit/create_weightment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class BaggingEntryFormWidget extends StatefulWidget {
  const BaggingEntryFormWidget({super.key});

  @override
  State<BaggingEntryFormWidget> createState() => _BaggingEntryFormWidgetState();
}

class _BaggingEntryFormWidgetState extends State<BaggingEntryFormWidget> {
  File? _lastCapturedPhoto;
  final ScrollController _scrollController = ScrollController();
  final focusNodes = List.generate(60, (index) => FocusNode());

  final Color primaryTeal = const Color(0xFF26A69A);
  final Color lightBg = const Color(0xFFF1F8F9);
  void _showBlurryImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red),
            SizedBox(width: 10),
            Text("Extraction Failed"),
          ],
        ),
        content: const Text(
          "Could not detect weight. The image might be blurred or the scale is not visible. Please try taking a clearer photo.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("RETRY"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateBaggingEntryCubit>().state;

    final weightState = context.watch<WeightmentCubit>().state;
    final newform = state.form;
    final lines = state.lines;

    print('newform.docstatus :::${newform.docstatus}');

    print('state.newlines :::${state.lines.length}');
Future<void> onBagButtonPressed() async {
  final picker = ImagePicker();
  final XFile? photo = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

  if (photo != null && mounted) {

    setState(() { _lastCapturedPhoto = File(photo.path); }); 


    final watermarkedFile = await _addWatermark(File(photo.path));

    if (mounted) {
      _lastCapturedPhoto = watermarkedFile;
      // Now pass the watermarked file to the cubit
      context.read<WeightmentCubit>().extractWeight(_lastCapturedPhoto!);
    }
  }
}
    // Future<void> onBagButtonPressed() async {
    //   final picker = ImagePicker();
    //   final XFile? photo =
    //       await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    //       final watermarkedFile = await _addWatermark(File(photo!.path));

    //   if (photo != null) {
    //     if (mounted) {
    //       _lastCapturedPhoto = File(photo.path);
    //       context.read<WeightmentCubit>().extractWeight(_lastCapturedPhoto!);
    //     }
    //   }
    // }

    return MultiBlocListener(
      listeners: [
        BlocListener<CreateBaggingEntryCubit, CreateBaggingEntryState>(
          listenWhen: (previous, current) =>
              previous.error?.status != current.error?.status,
          listener: (_, state) async {
            final indx = state.error?.status;
            if (indx != null) {
              final focus = focusNodes.elementAt(indx);
              FocusScope.of(context).requestFocus(focus);
            }
          },
        ),
        BlocListener<WeightmentCubit, WeightmentState>(
          listener: (context, weightState) {
            if (weightState.isExtracting) return;

            if (weightState.error != null) {
              _showBlurryImageDialog(context);
              context.read<WeightmentCubit>().reset();
              return;
            }

            if (weightState.extractedWeight != null) {
              final baggingCubit = context.read<CreateBaggingEntryCubit>();
              double? weight = double.tryParse(weightState.extractedWeight!);

              if (weight == null || weight <= 0) {
                _showBlurryImageDialog(context);
              } else if (baggingCubit.state.lines.length >= 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Maximum limit of 10 bags reached.")),
                );
              } else {
                baggingCubit.addLineItem(
                  weight: weight,
                  imageFile: _lastCapturedPhoto!,
                );
              }

              context.read<WeightmentCubit>().reset();
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: state.lines.length >= 10
            ? null
            : FloatingActionButton.extended(
                onPressed: weightState.isExtracting ? null : onBagButtonPressed,
                backgroundColor: primaryTeal,
                icon: weightState.isExtracting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2),
                      )
                    : const Icon(Icons.camera_alt, color: Colors.white),
                label: Text(
                  weightState.isExtracting ? "Extracting..." : "Bag",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (newform.docstatus != 1) ...[
                  if (state.newlines.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 125,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryTeal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  if (state.view ==
                                      BaggingEntryView.completed) {
                                    context
                                        .read<CreateBaggingEntryCubit>()
                                        .submit();
                                  } else {
                                    context
                                        .read<CreateBaggingEntryCubit>()
                                        .save();
                                  }
                                },
                          // state.isLoading ||
                          //         state.view == BaggingEntryView.submitted
                          //     ? null
                          //     : () => context
                          //         .read<CreateBaggingEntryCubit>()
                          //         .save(),

                          child: state.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      color: Colors.white, strokeWidth: 2),
                                )
                              : Text(
                                  state.view.toName(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 16),
                  ] else if (state.lines.length >= 10) ...[
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 125,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryTeal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: state.isLoading ||
                                  state.view == BaggingEntryView.submitted
                              ? null
                              : () => context
                                  .read<CreateBaggingEntryCubit>()
                                  .submit(),
                          child: state.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                      color: Colors.white, strokeWidth: 2),
                                )
                              : const Text(
                                  'Submit',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  ]
                ],
                const Text("Bagging Details :",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: lightBg,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(color: primaryTeal, offset: const Offset(4, 4)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDetailItem(
                              Icons.calendar_month,
                              "Production Date",
                              DFU.ddMMyyyyFromStr(
                                  newform.productionDate ?? '')),
                          _buildDetailItem(Icons.access_time, "Creation Time",
                              DFU.timeLabelFromStr(newform.creation ?? '')),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDetailItem(
                              Icons.person, "Shift", newform.shift ?? "N/A"),
                          _buildDetailItem(Icons.assignment, "Batch",
                              newform.batch ?? "N/A"),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDetailItem(Icons.scale, "Total Batch Qty (Kg)",
                              (newform.totalBatchQty ?? 0).toStringAsFixed(2)),
                          _buildDetailItem(
                              Icons.scale,
                              "Total Batch Qty (MT)",
                              (newform.totalBatchQty! / 1000)
                                  .toStringAsFixed(2))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text("Bagging Entry Lines",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                _buildTable(lines),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String title, String value) {
    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: primaryTeal),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                Text(
                  value,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable(List<ItemModel> lines) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: primaryTeal,
            child: const Row(
              children: [
                _TableCell(text: "#", isHeader: true, flex: 1),
                _TableCell(text: "Bag No.", isHeader: true, flex: 2),
                _TableCell(text: "Qty (kg)", isHeader: true, flex: 2),
                _TableCell(text: "Serial No.", isHeader: true, flex: 3),
                _TableCell(text: "Sticker Print", isHeader: true, flex: 2),
              ],
            ),
          ),
          ...lines.asMap().entries.map((entry) {
            int idx = entry.key;
            var line = entry.value;
            return Row(
              children: [
                _TableCell(
                    text: "${idx + 1}",
                    isHeader: false,
                    flex: 1,
                    textColor: primaryTeal),
                _TableCell(text: line.bagNo ?? "", isHeader: false, flex: 2),
                _TableCell(
                    text: line.qty?.toString() ?? "", isHeader: false, flex: 2),
                _TableCell(text: line.serialNo ?? "", isHeader: false, flex: 3),
                // _TableCell(
                //     text: line.stickerPrinted == 1 ? "✔" : "Yet to Print",
                //     isHeader: false,
                //     flex: 2),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.grey.shade300, width: 0.5),
                    ),
                    child: Checkbox(
                      value: line.stickerPrinted == 1,
                      onChanged: null,
                      activeColor: primaryTeal,
                      checkColor: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  final String text;
  final bool isHeader;
  final int flex;
  final Color? textColor;

  const _TableCell(
      {required this.text,
      required this.isHeader,
      required this.flex,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 0.5)),
        child: Text(
          text,
          style: TextStyle(
            color: isHeader ? Colors.white : (textColor ?? Colors.black),
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
Future<File> _addWatermark(File imageFile) async {

  final bytes = await imageFile.readAsBytes();
  img.Image? originalImage = img.decodeImage(bytes);
  if (originalImage == null) return imageFile;


  String timestamp = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());



  img.drawString(
    originalImage,
    timestamp,
    font: img.arial24, 
    x: 20, 
    y: originalImage.height - 50, 
    color: img.ColorRgb8(255, 255, 255), 
  );


  final tempDir = await getTemporaryDirectory();
  final path = "${tempDir.path}/watermarked_${DateTime.now().millisecondsSinceEpoch}.jpg";
  
  final watermarkedFile = File(path);
  await watermarkedFile.writeAsBytes(img.encodeJpg(originalImage, quality: 85));

  return watermarkedFile;
}