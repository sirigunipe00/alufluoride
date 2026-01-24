import 'dart:convert';
import 'dart:io';

import 'package:alufluoride/core/model/failure.dart';
import 'package:alufluoride/features/production_baggging_entry/data/bagging_entry_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;

part 'create_weightment_cubit.freezed.dart';

@injectable
class WeightmentCubit extends Cubit<WeightmentState> {
  final BaggingEntryRepo repo;

  WeightmentCubit(this.repo) : super(WeightmentState.initial());

  // Future<void> extractWeight(File file) async {
  //   try {
  //     emit(state.copyWith(isExtracting: true, error: null));

  //     final bytes = await file.readAsBytes();
  //     final base64Image = base64Encode(bytes);
  //     final dataUri = "data:image/jpeg;base64,$base64Image";

  //     final response = await repo.getweightmentResult(dataUri);

  //     response.fold(
  //       (l) => emit(state.copyWith(
  //         isExtracting: false,
  //         error: Failure(error: l.error, title: 'Extraction Failed'),
  //       )),
  //       (r) => emit(state.copyWith(
  //         isExtracting: false,
  //         extractedWeight: r.weight,
  //       )),
  //     );
  //   } catch (e) {
  //     emit(state.copyWith(isExtracting: false));
  //   }
  // }

  Future<void> extractWeight(File file) async {
    try {
      emit(state.copyWith(isExtracting: true, error: null));

      final bytes = await file.readAsBytes();
      final base64Image = base64Encode(bytes);

      final extension = p.extension(file.path).toLowerCase();

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
          error: Failure(error: l.error, title: 'Extraction Failed'),
        )),
        (r) {
          if (r.weight == null || r.weight!.trim().isEmpty) {
            emit(state.copyWith(
              isExtracting: false,
              extractedWeight: null,
              error: const Failure(
                  error: "Could not detect weight.",
                  title: 'Extraction Failed'),
            ));
          } else {
            emit(state.copyWith(
              isExtracting: false,
              extractedWeight: r.weight,
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
  }) = _WeightmentState;

  factory WeightmentState.initial() => const WeightmentState(
        isExtracting: false,
      );
}
