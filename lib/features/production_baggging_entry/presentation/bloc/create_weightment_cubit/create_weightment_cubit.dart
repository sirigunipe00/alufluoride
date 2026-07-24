import 'dart:convert';
import 'dart:io';
import 'package:alufluoride/core/model/failure.dart';
import 'package:alufluoride/features/production_baggging_entry/data/bagging_entry_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

part 'create_weightment_cubit.freezed.dart';

@injectable
class WeightmentCubit extends Cubit<WeightmentState> {
  final BaggingEntryRepo repo;

  WeightmentCubit(this.repo) : super(WeightmentState.initial());

  Future<File> addWatermarkOptimized(File imageFile) async {

    final bytes = await imageFile.readAsBytes();
    final decoded = img.decodeImage(bytes);

    if (decoded == null) return imageFile;

    final resized = img.copyResize(
      decoded,
      width: 1024,
      interpolation: img.Interpolation.average,
    );

    final timestamp = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

    img.drawString(
      resized,
      timestamp,
      font: img.arial24,
      x: 20,
      y: resized.height - img.arial24.lineHeight - 10,
      color: img.ColorRgb8(255, 255, 255),
    );

    final jpgBytes = img.encodeJpg(
      resized,
      quality: 65,
    );

    final tempDir = await getTemporaryDirectory();
    final path =
        '${tempDir.path}/wm_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final file = File(path);
    await file.writeAsBytes(jpgBytes);

    return file;
  }
  Future<void> captureEmptyWeight(File file) async {
    try {
      emit(state.copyWith(isExtracting: true, error: null));

      final watermarkedFile = await addWatermarkOptimized(file);
      final bytes = await watermarkedFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      final extension = p.extension(watermarkedFile.path).toLowerCase();
      final mimeType = extension == '.png'
          ? 'png'
          : extension == '.webp'
              ? 'webp'
              : 'jpeg';

      final response = await repo.getweightmentResult(
        "data:image/$mimeType;base64,$base64Image",
      );

      response.fold(
        (l) => emit(state.copyWith(
          isExtracting: false,
          error: Failure(title: 'Extraction Failed', error: l.error),
        )),
        (r) {
          final parsedWeight = double.tryParse(r.weight ?? '');
          if (parsedWeight == null) {
            emit(state.copyWith(
              isExtracting: false,
              error: Failure(
                title: 'Extraction Failed',
                error:  r.message ?? 'Please make sure the weighing scale display is clearly visible and try again.',
              ),
            ));
            return;
          }

          emit(state.copyWith(
            isExtracting: false,
            emptyWeight: parsedWeight,
            emptyImage: watermarkedFile,
            error: null,
          ));
        },
      );
    } catch (e, st) {
      debugPrint('captureEmptyWeight error: $e\n$st');
      emit(state.copyWith(
        isExtracting: false,
        error: Failure(title: 'Error', error: e.toString()),
      ));
    }
  }


  Future<void> captureFilledWeightForLine(int lineIndex, File file) async {
    try {
      emit(state.copyWith(
        isExtracting: true,
        error: null,
        activeLineIndex: lineIndex,
      ));

      final watermarkedFile = await addWatermarkOptimized(file);
      final bytes = await watermarkedFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      final extension = p.extension(watermarkedFile.path).toLowerCase();
      final mimeType = extension == '.png'
          ? 'png'
          : extension == '.webp'
              ? 'webp'
              : 'jpeg';

      final response = await repo.getweightmentResult(
        "data:image/$mimeType;base64,$base64Image",
      );

      response.fold(
        (l) => emit(state.copyWith(
          isExtracting: false,
          error: Failure(title: 'Extraction Failed', error: l.error),
        )),
        (r) {
          final parsedWeight = double.tryParse(r.weight ?? '');
          if (parsedWeight == null) {
            emit(state.copyWith(
              isExtracting: false,
              error:  Failure(
                title: 'Extraction Failed',
                error: r.message ?? 'Please make sure the weighing scale display is clearly visible and try again.',
              ),
            ));
            return;
          }

          emit(state.copyWith(
            isExtracting: false,
            finalWeight: parsedWeight,
            filledImage: watermarkedFile,
            error: null,
          ));
        },
      );
    } catch (e, st) {
      debugPrint('captureFilledWeightForLine error: $e\n$st');
      emit(state.copyWith(
        isExtracting: false,
        error: Failure(title: 'Error', error: e.toString()),
      ));
    }
  }

  void clearCurrentBag() {
    emit(state.copyWith(
      emptyWeight: null,
      emptyImage: null,
      finalWeight: null,
      filledImage: null,
      activeLineIndex: null,
      error: null,
    ));
  }

  void reset() => emit(WeightmentState.initial());
}

@freezed
class WeightmentState with _$WeightmentState {
  const factory WeightmentState({
    required bool isExtracting,
    double? emptyWeight,
    File? emptyImage,
    double? finalWeight,
    File? filledImage,
    int? activeLineIndex,
    Failure? error,
  }) = _WeightmentState;

  factory WeightmentState.initial() => const WeightmentState(isExtracting: false);
}