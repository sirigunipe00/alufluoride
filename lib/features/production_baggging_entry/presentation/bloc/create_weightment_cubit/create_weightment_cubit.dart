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
  Future<void> extractWeight(File file) async {
    try {
      emit(state.copyWith(isExtracting: true, error: null));
      final watermarkedFile = await addWatermarkOptimized(file);

      final bytes = await watermarkedFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      final extension = p.extension(watermarkedFile.path).toLowerCase();

      String mimeType;
      if (extension == '.png') {
        mimeType = 'png';
      } else if (extension == '.webp') {
        mimeType = 'webp';
      } else {
        mimeType = 'jpeg';
      }

      final dataUri = "data:image/$mimeType;base64,$base64Image";

      final response = await repo.getweightmentResult(dataUri);
      response.fold(
        (l) => emit(state.copyWith(
          isExtracting: false,
          watermarkedImage: watermarkedFile,
          error: Failure(error: l.error, title: 'Extraction Failed'),
        )),
        (r) {
          if (r.weight == null || r.weight!.trim().isEmpty) {
            emit(state.copyWith(
              isExtracting: false,
              extractedWeight: null,
              watermarkedImage: watermarkedFile,
              error: const Failure(
                  error: "Could not detect weight.",
                  title: 'Extraction Failed'),
            ));
          } else {
            emit(state.copyWith(
              isExtracting: false,
              extractedWeight: r.weight,
              watermarkedImage: watermarkedFile,
              error: null,
            ));
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(isExtracting: false));
    }
  }

  void reset() => emit(WeightmentState.initial());
}

@freezed
class WeightmentState with _$WeightmentState {
  const factory WeightmentState({
    required bool isExtracting,
    String? extractedWeight,
    Failure? error,
    File? watermarkedImage,
  }) = _WeightmentState;

  factory WeightmentState.initial() => const WeightmentState(
        isExtracting: false,
      );
}
