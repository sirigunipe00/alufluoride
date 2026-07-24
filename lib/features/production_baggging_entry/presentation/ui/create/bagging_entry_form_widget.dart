// import 'dart:io';
// import 'package:alufluoride/core/utils/date_format_util.dart';
// import 'package:alufluoride/features/production_baggging_entry/model/item_model.dart';
// import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_bagging_entry_cubit/create_bagging_entry_cubit.dart';
// import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_weightment_cubit/create_weightment_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

// class BaggingEntryFormWidget extends StatefulWidget {
//   const BaggingEntryFormWidget({super.key});

//   @override
//   State<BaggingEntryFormWidget> createState() => _BaggingEntryFormWidgetState();
// }

// class _BaggingEntryFormWidgetState extends State<BaggingEntryFormWidget> {
//   OverlayEntry? _blockingOverlay;

//   void _setBlockingOverlay(bool show) {
//     if (show) {
//       if (_blockingOverlay != null) return;
//       _blockingOverlay = OverlayEntry(
//         builder: (_) => const Positioned.fill(
//           child: AbsorbPointer(
//             absorbing: true,
//             child: ColoredBox(color: Colors.transparent),
//           ),
//         ),
//       );
//       Overlay.of(context, rootOverlay: true).insert(_blockingOverlay!);
//     } else {
//       _blockingOverlay?.remove();
//       _blockingOverlay = null;
//     }
//   }

//   @override
//   void dispose() {
//     _blockingOverlay?.remove();
//     super.dispose();
//   }
//   final ScrollController _scrollController = ScrollController();
//   final focusNodes = List.generate(60, (index) => FocusNode());

//   final Color primaryTeal = const Color(0xFF26A69A);
//   final Color lightBg = const Color(0xFFF1F8F9);

//   void _showBlurryImageDialog(
//     BuildContext context, {
//     required String title,
//     required String message,
//   }) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (dialogContext) => AlertDialog(
//         title: Row(
//           children: [
//             const Icon(Icons.warning_amber_rounded, color: Colors.red),
//             const SizedBox(width: 10),
//             Expanded(child: Text(title)),
//           ],
//         ),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(dialogContext).pop(),
//             child: const Text("RETRY"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final state = context.watch<CreateBaggingEntryCubit>().state;
//     final weightState = context.watch<WeightmentCubit>().state;
//     final newform = state.form;
//     final lines = state.lines;
// final isBusy = weightState.isExtracting || state.isLoading;
//     final hasPendingLine =
//         lines.any((line) => line.qty == null || line.qty! <= 0);

//     // Hide "Add New Bag" while: 10 bags reached, a bag is waiting on its
//     // filled photo, there are unsaved local edits pending the Update call,
//     // a save is in flight, or an image is currently being extracted.
//     final blockNewBag = state.lines.length >= 10 ||
//         hasPendingLine ||
//         state.newlines.isNotEmpty ||
//         state.isLoading ||
//         weightState.isExtracting;

//     Future<void> onCaptureEmptyPressed() async {
//       final picker = ImagePicker();
//       final photo = await picker.pickImage(
//         source: ImageSource.camera,
//         imageQuality: 80,
//       );

//       if (photo == null || !context.mounted) return;

//       context.read<WeightmentCubit>().captureEmptyWeight(File(photo.path));
//     }

//     Future<void> onCaptureFilledPressed(int lineIndex) async {
//       final picker = ImagePicker();
//       final photo = await picker.pickImage(
//         source: ImageSource.camera,
//         imageQuality: 80,
//       );

//       if (photo == null || !context.mounted) return;

//       context
//           .read<WeightmentCubit>()
//           .captureFilledWeightForLine(lineIndex, File(photo.path));
//     }

//     return MultiBlocListener(
//       listeners: [
//         BlocListener<CreateBaggingEntryCubit, CreateBaggingEntryState>(
//           listenWhen: (previous, current) =>
//               previous.error?.status != current.error?.status,
//           listener: (_, state) async {
//             final indx = state.error?.status;
//             if (indx != null) {
//               final focus = focusNodes.elementAt(indx);
//               FocusScope.of(context).requestFocus(focus);
//             }
//           },
//         ),
//         BlocListener<WeightmentCubit, WeightmentState>(
//           listenWhen: (previous, current) =>
//               previous.isExtracting != current.isExtracting ||
//               previous.emptyWeight != current.emptyWeight ||
//               previous.finalWeight != current.finalWeight ||
//               previous.error != current.error,
//           listener: (context, weightState) {
//             if (weightState.isExtracting) return;

//             if (weightState.error != null) {
//               _showBlurryImageDialog(
//                 context,
//                 title: weightState.error?.title ?? 'Extraction Failed',
//                 message: weightState.error?.error ?? 'Could not detect weight.',
//               );
//               context.read<WeightmentCubit>().clearCurrentBag();
//               return;
//             }

//             if (weightState.emptyWeight != null &&
//                 weightState.emptyImage != null &&
//                 weightState.activeLineIndex == null) {
//               context.read<CreateBaggingEntryCubit>().addEmptyPalletLine(
//                     weightOfPalletandBag: weightState.emptyWeight!,
//                     emptyImage: weightState.emptyImage!,
//                   );
//               context.read<WeightmentCubit>().clearCurrentBag();
//               return;
//             }

//             if (weightState.finalWeight != null &&
//                 weightState.filledImage != null &&
//                 weightState.activeLineIndex != null) {
//               context.read<CreateBaggingEntryCubit>().updateFilledWeightForLine(
//                     lineIndex: weightState.activeLineIndex!,
//                     filledWeight: weightState.finalWeight!,
//                     filledImage: weightState.filledImage!,
//                   );
//               context.read<WeightmentCubit>().clearCurrentBag();
//             }
//           },
//         ),
//       ],
//       child: PopScope(
//         canPop: !isBusy,
//     onPopInvokedWithResult: (didPop, result) {
//       if (!didPop) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please wait, saving in progress...')),
//         );
//       }
//     },

//         child: Scaffold(
//           backgroundColor: Colors.white,
//           floatingActionButton: blockNewBag
//               ? null
//               : FloatingActionButton.extended(
//                   onPressed: onCaptureEmptyPressed,
//                   backgroundColor: primaryTeal,
//                   icon: const Icon(Icons.camera_alt, color: Colors.white),
//                   label: const Text(
//                     "Add New Bag",
//                     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//           body: Stack(
//             children: [
//               AbsorbPointer(
//                 absorbing: isBusy,
//                 child: Container(
//                   color: Colors.white,
//                   child: SingleChildScrollView(
//                     controller: _scrollController,
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         // if (newform.docstatus != 1) ...[
//                         //   if (state.newlines.isNotEmpty) ...[
//                         //     Align(
//                         //       alignment: Alignment.topRight,
//                         //       child: SizedBox(
//                         //         width: 125,
//                         //         height: 50,
//                         //         child: ElevatedButton(
//                         //           style: ElevatedButton.styleFrom(
//                         //             backgroundColor: primaryTeal,
//                         //             shape: RoundedRectangleBorder(
//                         //               borderRadius: BorderRadius.circular(8),
//                         //             ),
//                         //           ),
//                         //           onPressed: (state.isLoading || weightState.isExtracting)
//                         //               ? null
//                         //               : () => context.read<CreateBaggingEntryCubit>().save(),
//                         //           child: (state.isLoading || weightState.isExtracting)
//                         //               ? const SizedBox(
//                         //                   height: 20,
//                         //                   width: 20,
//                         //                   child: CircularProgressIndicator(
//                         //                       color: Colors.white, strokeWidth: 2),
//                         //                 )
//                         //               : const Text(
//                         //                   "Update",
//                         //                   style: TextStyle(
//                         //                       color: Colors.black,
//                         //                       fontWeight: FontWeight.bold,
//                         //                       fontSize: 15),
//                         //                 ),
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   ] else 
//                           if (newform.docstatus != 1) ...[
//                           if (state.lines.length >= 10) ...[
//                             Align(
//                               alignment: Alignment.topRight,
//                               child: SizedBox(
//                                 width: 125,
//                                 height: 50,
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: primaryTeal,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   onPressed: state.isLoading ||
//                                           state.view == BaggingEntryView.submitted
//                                       ? null
//                                       : () => context.read<CreateBaggingEntryCubit>().submit(),
//                                   child: state.isLoading
//                                       ? const SizedBox(
//                                           height: 20,
//                                           width: 20,
//                                           child: CircularProgressIndicator(
//                                               color: Colors.white, strokeWidth: 2),
//                                         )
//                                       : const Text(
//                                           'Submit',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ],
//                         const Text("Bagging Details :",
//                             style: TextStyle(fontWeight: FontWeight.bold)),
//                         const SizedBox(height: 8),
//                         Container(
//                           padding: const EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: lightBg,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: Colors.black),
//                             boxShadow: [
//                               BoxShadow(color: primaryTeal, offset: const Offset(4, 4)),
//                             ],
//                           ),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   _buildDetailItem(
//                                       Icons.calendar_month,
//                                       "Production Date",
//                                       DFU.ddMMyyyyFromStr(newform.productionDate ?? '')),
//                                   _buildDetailItem(Icons.access_time, "Creation Time",
//                                       DFU.timeLabelFromStr(newform.creation ?? '')),
//                                 ],
//                               ),
//                               const SizedBox(height: 16),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   _buildDetailItem(Icons.person, "Shift", newform.shift ?? "N/A"),
//                                   _buildDetailItem(
//                                       Icons.assignment, "Batch", newform.batch ?? "N/A"),
//                                 ],
//                               ),
//                               const SizedBox(height: 16),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   _buildDetailItem(Icons.scale, "Total Batch Qty (Kg)",
//                                       (newform.totalBatchQty ?? 0).toStringAsFixed(2)),
//                                   _buildDetailItem(
//                                       Icons.scale,
//                                       "Total Batch Qty (MT)",
//                                       (newform.totalBatchQty! / 1000).toStringAsFixed(2)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         const Text("Bagging Entry Lines",
//                             style: TextStyle(fontWeight: FontWeight.bold)),
//                         const SizedBox(height: 8),
//                         _buildTable(
//                           context,
//                           lines,
//                           weightState.isExtracting,
//                           weightState.activeLineIndex,
//                           onCaptureFilledPressed,
//                         ),
//                         const SizedBox(height: 100),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
        
//               // Global overlay while an image is being sent for extraction.
//               if (weightState.isExtracting)
//                 Positioned(
//                   bottom: 24,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.black87,
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                       child: const Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           SizedBox(
//                             width: 16,
//                             height: 16,
//                             child: CircularProgressIndicator(
//                                 color: Colors.white, strokeWidth: 2),
//                           ),
//                           SizedBox(width: 12),
//                           Text(
//                             "Extracting weight...",
//                             style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailItem(IconData icon, String title, String value) {
//     return Flexible(
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 16, color: primaryTeal),
//           const SizedBox(width: 8),
//           Flexible(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: const TextStyle(
//                         fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600)),
//                 Text(
//                   value,
//                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTable(
//     BuildContext context,
//     List<ItemModel> lines,
//     bool isExtracting,
//     int? activeLineIndex,
//     Future<void> Function(int lineIndex) onAddPhoto,
//   ) {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             color: primaryTeal,
//             child: const Row(
//               children: [
//                 _TableCell(text: "#", isHeader: true, flex: 1),
//                 _TableCell(text: "Bag\nNo.", isHeader: true, flex: 1),
//                 _TableCell(text: 'Pallet\nWeight', isHeader: true, flex: 2),
//                 _TableCell(text: 'Actual\nWeight', isHeader: true, flex: 2),
//                 _TableCell(text: "Qty (kg)", isHeader: true, flex: 2),
//                 _TableCell(text: "Serial", flex: 3, isHeader: true),
//                 _TableCell(text: "Sticker\nPrint", isHeader: true, flex: 2),
//                 _TableCell(text: "Filled\nPhoto", isHeader: true, flex: 2),
//               ],
//             ),
//           ),
//           ...lines.asMap().entries.map((entry) {
//             int idx = entry.key;
//             var line = entry.value;
//             final hasFilledPhoto = line.qty != null && line.qty! > 0;
//             final isThisRowLoading = isExtracting && activeLineIndex == idx;

//             return Row(
//               children: [
//                 _TableCell(
//                     text: "${idx + 1}", isHeader: false, flex: 1, textColor: primaryTeal),
//                 _TableCell(text: line.bagNo ?? "", isHeader: false, flex: 1),
//                 _TableCell(
//                   text: line.weightOfPalletandBag?.toStringAsFixed(2) ?? "",
//                   isHeader: false,
//                   flex: 2,
//                 ),
//                 _TableCell(
//                   text: line.actualBagWeight?.toStringAsFixed(2) ?? "",
//                   isHeader: false,
//                   flex: 2,
//                 ),
//                 _TableCell(
//                   text: hasFilledPhoto ? line.qty!.toStringAsFixed(2) : "",
//                   isHeader: false,
//                   flex: 2,
//                   textColor: hasFilledPhoto ? Colors.black : Colors.orange,
//                 ),
//                 _TableCell(text: line.serialNo ?? "", isHeader: false, flex: 3),
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     height: 40,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey.shade300, width: 0.5)),
//                     child: Checkbox(
//                       value: line.stickerPrinted == 1,
//                       onChanged: null,
//                       activeColor: primaryTeal,
//                       checkColor: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     height: 40,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey.shade300, width: 0.5)),
//                     child: isThisRowLoading
//                         ? const SizedBox(
//                             width: 18,
//                             height: 18,
//                             child: CircularProgressIndicator(strokeWidth: 2),
//                           )
//                         : hasFilledPhoto
//                             ? const Icon(Icons.check_circle, color: Colors.green, size: 20)
//                             : IconButton(
//                                 icon: const Icon(Icons.add_a_photo, size: 20),
//                                 color: primaryTeal,
//                                 onPressed: isExtracting ? null : () => onAddPhoto(idx),
//                               ),
//                   ),
//                 ),
//               ],
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }

// class _TableCell extends StatelessWidget {
//   final String text;
//   final bool isHeader;
//   final int flex;
//   final Color? textColor;

//   const _TableCell(
//       {required this.text, required this.isHeader, required this.flex, this.textColor});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: flex,
//       child: Container(
//         height: 40,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300, width: 0.5)),
//         child: Text(
//           text,
//           style: TextStyle(
//             color: isHeader ? Colors.white : (textColor ?? Colors.black),
//             fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//             fontSize: 12,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:alufluoride/core/utils/date_format_util.dart';
import 'package:alufluoride/features/production_baggging_entry/model/item_model.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_bagging_entry_cubit/create_bagging_entry_cubit.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_weightment_cubit/create_weightment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class BaggingEntryFormWidget extends StatefulWidget {
  const BaggingEntryFormWidget({super.key});

  @override
  State<BaggingEntryFormWidget> createState() => _BaggingEntryFormWidgetState();
}

class _BaggingEntryFormWidgetState extends State<BaggingEntryFormWidget> {
  final ScrollController _scrollController = ScrollController();
  final focusNodes = List.generate(60, (index) => FocusNode());

  final Color primaryTeal = const Color(0xFF26A69A);
  final Color lightBg = const Color(0xFFF1F8F9);

  // ---- Root-level blocking overlay (freezes back button + bottom nav) ----
  OverlayEntry? _blockingOverlay;

  void _setBlockingOverlay(bool show) {
    if (show) {
      if (_blockingOverlay != null) return; // already showing
      _blockingOverlay = OverlayEntry(
        builder: (_) => const Positioned.fill(
          child: AbsorbPointer(
            absorbing: true,
            child: ColoredBox(color: Colors.transparent),
          ),
        ),
      );
      Overlay.of(context, rootOverlay: true).insert(_blockingOverlay!);
    } else {
      _blockingOverlay?.remove();
      _blockingOverlay = null;
    }
  }

  @override
  void dispose() {
    _blockingOverlay?.remove();
    _blockingOverlay = null;
    for (final node in focusNodes) {
      node.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  void _showBlurryImageDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.red),
            const SizedBox(width: 10),
            Expanded(child: Text(title)),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
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
    final isBusy = weightState.isExtracting || state.isLoading;

    final hasPendingLine =
        lines.any((line) => line.qty == null || line.qty! <= 0);

    final blockNewBag = state.lines.length >= 10 ||
        hasPendingLine ||
        state.newlines.isNotEmpty ||
        state.isLoading ||
        weightState.isExtracting;

    Future<void> onCaptureEmptyPressed() async {
      final picker = ImagePicker();
      final photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (photo == null || !context.mounted) return;

      context.read<WeightmentCubit>().captureEmptyWeight(File(photo.path));
    }

    Future<void> onCaptureFilledPressed(int lineIndex) async {
      final picker = ImagePicker();
      final photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (photo == null || !context.mounted) return;

      context
          .read<WeightmentCubit>()
          .captureFilledWeightForLine(lineIndex, File(photo.path));
    }

    return MultiBlocListener(
      listeners: [
        // Re-evaluate the blocking overlay whenever isLoading changes.
        // Reads WeightmentCubit fresh at fire-time instead of capturing
        // the outer `weightState`, which would otherwise be stale.
        BlocListener<CreateBaggingEntryCubit, CreateBaggingEntryState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading ||
              previous.error?.status != current.error?.status,
          listener: (ctx, s) {
            final extracting = ctx.read<WeightmentCubit>().state.isExtracting;
            _setBlockingOverlay(s.isLoading || extracting);

            final indx = s.error?.status;
            if (indx != null && indx < focusNodes.length) {
              final focus = focusNodes.elementAt(indx);
              FocusScope.of(ctx).requestFocus(focus);
            }
          },
        ),
        // Re-evaluate the blocking overlay whenever isExtracting changes.
        // Reads CreateBaggingEntryCubit fresh at fire-time for the same
        // reason as above.
        BlocListener<WeightmentCubit, WeightmentState>(
          listenWhen: (previous, current) =>
              previous.isExtracting != current.isExtracting ||
              previous.emptyWeight != current.emptyWeight ||
              previous.finalWeight != current.finalWeight ||
              previous.error != current.error,
          listener: (ctx, weightState) {
            final loading = ctx.read<CreateBaggingEntryCubit>().state.isLoading;
            _setBlockingOverlay(weightState.isExtracting || loading);

            if (weightState.isExtracting) return;

            if (weightState.error != null) {
              _showBlurryImageDialog(
                ctx,
                title: weightState.error?.title ?? 'Extraction Failed',
                message: weightState.error?.error ?? 'Could not detect weight.',
              );
              ctx.read<WeightmentCubit>().clearCurrentBag();
              return;
            }

            if (weightState.emptyWeight != null &&
                weightState.emptyImage != null &&
                weightState.activeLineIndex == null) {
              ctx.read<CreateBaggingEntryCubit>().addEmptyPalletLine(
                    weightOfPalletandBag: weightState.emptyWeight!,
                    emptyImage: weightState.emptyImage!,
                  );
              ctx.read<WeightmentCubit>().clearCurrentBag();
              return;
            }

            if (weightState.finalWeight != null &&
                weightState.filledImage != null &&
                weightState.activeLineIndex != null) {
              ctx.read<CreateBaggingEntryCubit>().updateFilledWeightForLine(
                    lineIndex: weightState.activeLineIndex!,
                    filledWeight: weightState.finalWeight!,
                    filledImage: weightState.filledImage!,
                  );
              ctx.read<WeightmentCubit>().clearCurrentBag();
            }
          },
        ),
      ],
      child: PopScope(
        canPop: !isBusy,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please wait, saving in progress...')),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: blockNewBag
              ? null
              : FloatingActionButton.extended(
                  onPressed: onCaptureEmptyPressed,
                  backgroundColor: primaryTeal,
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  label: const Text(
                    "Add New Bag",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
          body: Stack(
            children: [
              AbsorbPointer(
                absorbing: isBusy,
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (newform.docstatus != 1) ...[
                          if (state.lines.length >= 10) ...[
                            Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                width: 125,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryTeal,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: state.isLoading ||
                                          state.view == BaggingEntryView.submitted
                                      ? null
                                      : () => context.read<CreateBaggingEntryCubit>().submit(),
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
                          ],
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
                                      DFU.ddMMyyyyFromStr(newform.productionDate ?? '')),
                                  _buildDetailItem(Icons.access_time, "Creation Time",
                                      DFU.timeLabelFromStr(newform.creation ?? '')),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildDetailItem(Icons.person, "Shift", newform.shift ?? "N/A"),
                                  _buildDetailItem(
                                      Icons.assignment, "Batch", newform.batch ?? "N/A"),
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
                                      (newform.totalBatchQty! / 1000).toStringAsFixed(2)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text("Bagging Entry Lines",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        _buildTable(
                          context,
                          lines,
                          weightState.isExtracting,
                          weightState.activeLineIndex,
                          onCaptureFilledPressed,
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              ),

              // Global overlay while an image is being sent for extraction.
              if (weightState.isExtracting)
                Positioned(
                  bottom: 24,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 2),
                          ),
                          SizedBox(width: 12),
                          Text(
                            "Extracting weight...",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
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
                        fontSize: 12, color: Colors.black, fontWeight: FontWeight.w600)),
                Text(
                  value,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTable(
    BuildContext context,
    List<ItemModel> lines,
    bool isExtracting,
    int? activeLineIndex,
    Future<void> Function(int lineIndex) onAddPhoto,
  ) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: primaryTeal,
            child: const Row(
              children: [
                _TableCell(text: "#", isHeader: true, flex: 1),
                _TableCell(text: "Bag\nNo.", isHeader: true, flex: 1),
                _TableCell(text: 'Pallet\nWeight', isHeader: true, flex: 2),
                _TableCell(text: 'Actual\nWeight', isHeader: true, flex: 2),
                _TableCell(text: "Qty (kg)", isHeader: true, flex: 2),
                _TableCell(text: "Serial", flex: 3, isHeader: true),
                _TableCell(text: "Sticker\nPrint", isHeader: true, flex: 2),
                _TableCell(text: "Filled\nPhoto", isHeader: true, flex: 2),
              ],
            ),
          ),
          ...lines.asMap().entries.map((entry) {
            int idx = entry.key;
            var line = entry.value;
            final hasFilledPhoto = line.qty != null && line.qty! > 0;
            final isThisRowLoading = isExtracting && activeLineIndex == idx;

            return Row(
              children: [
                _TableCell(
                    text: "${idx + 1}", isHeader: false, flex: 1, textColor: primaryTeal),
                _TableCell(text: line.bagNo ?? "", isHeader: false, flex: 1),
                _TableCell(
                  text: line.weightOfPalletandBag?.toStringAsFixed(2) ?? "",
                  isHeader: false,
                  flex: 2,
                ),
                _TableCell(
                  text: line.actualBagWeight?.toStringAsFixed(2) ?? "",
                  isHeader: false,
                  flex: 2,
                ),
                _TableCell(
                  text: hasFilledPhoto ? line.qty!.toStringAsFixed(2) : "",
                  isHeader: false,
                  flex: 2,
                  textColor: hasFilledPhoto ? Colors.black : Colors.orange,
                ),
                _TableCell(text: line.serialNo ?? "", isHeader: false, flex: 3),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 0.5)),
                    child: Checkbox(
                      value: line.stickerPrinted == 1,
                      onChanged: null,
                      activeColor: primaryTeal,
                      checkColor: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300, width: 0.5)),
                    child: isThisRowLoading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : hasFilledPhoto
                            ? const Icon(Icons.check_circle, color: Colors.green, size: 20)
                            : IconButton(
                                icon: const Icon(Icons.add_a_photo, size: 20),
                                color: primaryTeal,
                                onPressed: isExtracting ? null : () => onAddPhoto(idx),
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
      {required this.text, required this.isHeader, required this.flex, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300, width: 0.5)),
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