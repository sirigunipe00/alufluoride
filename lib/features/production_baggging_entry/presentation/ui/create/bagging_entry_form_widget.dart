import 'dart:io';
import 'package:alufluoride/core/utils/date_format_util.dart';
import 'package:alufluoride/features/production_baggging_entry/model/item_model.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_bagging_entry_cubit/create_bagging_entry_cubit.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_weightment_cubit/create_weightment_cubit.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class BaggingEntryFormWidget extends StatefulWidget {
  const BaggingEntryFormWidget({super.key});

  @override
  State<BaggingEntryFormWidget> createState() => _BaggingEntryFormWidgetState();
}

class _BaggingEntryFormWidgetState extends State<BaggingEntryFormWidget> {
  final ScrollController _scrollController = ScrollController();
  final focusNodes = List.generate(60, (index) => FocusNode());
  double? palletWeight;

  final Color primaryTeal = const Color(0xFF26A69A);
  final Color lightBg = const Color(0xFFF1F8F9);
  void onPalletQrScanned(String qrValue) {
    palletWeight = double.tryParse(qrValue);
  }

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

    Future<void> onBagButtonPressed() async {
      bool hasScanned = false;

      final scannedWeight = await Navigator.of(context).push<String>(
        MaterialPageRoute(
          builder: (routeContext) => Scaffold(
            appBar: AppBar(
              title: const Text("Scan Pallet QR"),
              backgroundColor: primaryTeal,
              foregroundColor: Colors.white,
            ),
            body: Stack(children: [
              MobileScanner(
                controller: MobileScannerController(
                  formats: const [BarcodeFormat.qrCode],
                ),
                onDetect: (capture) {
                  if (hasScanned) return;

                  final value = capture.barcodes.first.rawValue;

                  if (value == null || value.trim().isEmpty) return;

                  hasScanned = true;
                  Navigator.of(routeContext).pop(value.trim());
                },
              ),
              QRScannerOverlay(
                overlayColor: Colors.black54,
                borderColor: AppColors.invite,
                borderRadius: 16,
              ),
            ]),
          ),
        ),
      );

      if (scannedWeight == null) return;

      palletWeight = double.tryParse(scannedWeight);

      if (palletWeight == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid Pallet QR"),
            ),
          );
          return;
        }
      }
      final proceed = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text("Pallet Weight"),
          content: Text(
            "Scanned Pallet Weight\n\n${palletWeight!.toStringAsFixed(2)} Kg",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.of(context, rootNavigator: true).pop(false),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context, rootNavigator: true).pop(true),
              child: const Text("OK"),
            ),
          ],
        ),
      );

      if (proceed != true) {
        onBagButtonPressed(); // Open scanner again
        return;
      }

      final picker = ImagePicker();

      final photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (photo != null && context.mounted) {
        context.read<WeightmentCubit>().extractWeight(
              File(photo.path),
            );
      }
    }

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
          listenWhen: (previous, current) =>
              previous.isExtracting != current.isExtracting ||
              previous.extractedWeight != current.extractedWeight ||
              previous.error != current.error,
          listener: (context, weightState) {
            if (weightState.isExtracting) return;

            if (weightState.error != null) {
              _showBlurryImageDialog(context);
              context.read<WeightmentCubit>().reset();
              return;
            }

            if (weightState.extractedWeight != null) {
              final baggingCubit = context.read<CreateBaggingEntryCubit>();

              final totalWeight = double.tryParse(weightState.extractedWeight!);

              if (totalWeight == null || totalWeight <= 0) {
                _showBlurryImageDialog(context);
                return;
              }

              if (palletWeight == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Please scan the pallet QR first."),
                  ),
                );
                return;
              }

              final bagWeight = totalWeight - palletWeight!;

              if (bagWeight <= 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Invalid weight. Total weight is less than pallet weight."),
                  ),
                );
                return;
              }

              baggingCubit.addLineItem(
                weight: bagWeight,
                palletWeight: palletWeight.toString(),
                imageFile: weightState.watermarkedImage!,
              );

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
                  weightState.isExtracting ? "Extracting..." : "Scan Pallet",
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
                                  style: TextStyle(
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
                _TableCell(text: 'Pallet\nWeight', isHeader: true, flex: 2),
                _TableCell(text: "Qty (kg)", isHeader: true, flex: 2),
                _TableCell(text: "Serial No.", isHeader: true, flex: 3),
                _TableCell(text: "Sticker\nPrint", isHeader: true, flex: 2),
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
                  text: line.palletWeight?.toString() ?? "",
                  isHeader: false,
                  flex: 2,
                ),
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
