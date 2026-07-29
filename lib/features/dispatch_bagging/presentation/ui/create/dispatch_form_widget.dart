import 'package:alufluoride/core/utils/date_format_util.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_items.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/bloc/create_dispatch_cubit/create_dispatch_cubit.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class DispatchBaggingFormWidget extends StatefulWidget {
  const DispatchBaggingFormWidget({super.key});

  @override
  State<DispatchBaggingFormWidget> createState() =>
      _DispatchBaggingFormWidgetState();
}

class _DispatchBaggingFormWidgetState extends State<DispatchBaggingFormWidget> {
  final ScrollController _scrollController = ScrollController();
  final focusNodes = List.generate(60, (index) => FocusNode());

  final Color primaryTeal = AppColors.registration;
  final Color lightBg = const Color(0xFFF1F8F9);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CreateDispatchCubit>().state;
    final newform = state.form;
    final lines = state.lines;
    final isSubmitted = newform.docstatus == 1;

    Future<void> onBagButtonPressed() async {
      if (isSubmitted) return;
      if (state.lines.length >= 40) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Maximum 40 bags can be scanned."),
          ),
        );
        return;
      }
      bool hasScanned = false;
      final scannedBagNo = await Navigator.of(context).push<String>(
        MaterialPageRoute(
          builder: (routeContext) => Scaffold(
            appBar: AppBar(
              title: const Text("Scan Bag QR Code"),
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
                borderColor: Colors.green,
                borderRadius: 16,
              ),
            ]),
          ),
        ),
      );

      if (scannedBagNo == null || scannedBagNo.trim().isEmpty) return;
      if (!mounted) return;

      final alreadyAdded =
          state.lines.any((line) => line.bagNo == scannedBagNo);
      if (alreadyAdded) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Bag $scannedBagNo already added.")),
          );
          return;
        }
      }
      if (context.mounted) {
        context.read<CreateDispatchCubit>().addScannedBag(scannedBagNo);
      }
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<CreateDispatchCubit, CreateDispatchState>(
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
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: newform.docstatus == 1
            ? null
            : FloatingActionButton.extended(
                onPressed: onBagButtonPressed,
                backgroundColor: primaryTeal,
                icon: state.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2),
                      )
                    : const Icon(Icons.camera_alt, color: Colors.white),
                label: Text(
                  state.isLoading ? "Extracting..." : "Scan Bag",
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
                                  if (state.view == DispatchView.edit) {
                                    context.read<CreateDispatchCubit>().save();
                                  }
                                },
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
                  ],
                ] else ...[
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "This dispatch has been submitted. No further bags can be added.",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
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
                              DFU.ddMMyyyyFromStr(newform.postingDate ?? '')),
                          _buildDetailItem(Icons.access_time, "Creation Time",
                              DFU.timeLabelFromStr(newform.creation ?? '')),
                        ],
                      ),
                      // const SizedBox(height: 16),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     _buildDetailItem(
                      //         Icons.person, "Shift", newform.shift ?? "N/A"),
                      //     _buildDetailItem(Icons.assignment, "Batch",
                      //         newform.batch ?? "N/A"),
                      //   ],
                      // ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDetailItem(Icons.scale, "Total Batch Qty",
                              (newform.totalQty ?? 0).toStringAsFixed(2)),
                          // _buildDetailItem(
                          //     Icons.scale,
                          //     "Total Batch Qty (MT)",
                          //     (newform.totalBatchQty! / 1000)
                          //         .toStringAsFixed(2))
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text("Scanned Bag Lines",
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

  Widget _buildTable(List<DispatchItemsModel> lines) {
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
                _TableCell(text: "Batch", isHeader: true, flex: 2),
                _TableCell(text: "Bag Weight (MT)", isHeader: true, flex: 2),
                // _TableCell(text: "Serial No.", isHeader: true, flex: 3),
                // _TableCell(text: "Sticker Print", isHeader: true, flex: 2),
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
                _TableCell(text: line.batch ?? "", isHeader: false, flex: 2),
                _TableCell(
                    text: line.bagWeight?.toString() ?? "",
                    isHeader: false,
                    flex: 2),
                // _TableCell(text: line.qty?.toStringAsFixed(2) ?? "", isHeader: false, flex: 2),
                // _TableCell(text: line.serialNo ?? "", isHeader: false, flex: 3),
                // Expanded(
                //   flex: 2,
                //   child: Container(
                //     height: 40,
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey.shade300, width: 0.5),
                //     ),
                //     child: Checkbox(
                //       value: line.stickerPrinted == 1,
                //       onChanged: null,
                //       activeColor: primaryTeal,
                //       checkColor: Colors.white,
                //     ),
                //   ),
                // ),
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
            fontWeight: isHeader ? FontWeight.bold : FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
