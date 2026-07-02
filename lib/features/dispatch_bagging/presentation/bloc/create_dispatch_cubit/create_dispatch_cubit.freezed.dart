// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_dispatch_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateDispatchState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  DispatchView get view => throw _privateConstructorUsedError;
  List<DispatchItemsModel> get lines => throw _privateConstructorUsedError;
  List<DispatchItemsModel> get newlines => throw _privateConstructorUsedError;
  DispatchBaggingModel get form => throw _privateConstructorUsedError;
  DispatchItemsModel get items => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateDispatchStateCopyWith<CreateDispatchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateDispatchStateCopyWith<$Res> {
  factory $CreateDispatchStateCopyWith(
          CreateDispatchState value, $Res Function(CreateDispatchState) then) =
      _$CreateDispatchStateCopyWithImpl<$Res, CreateDispatchState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      DispatchView view,
      List<DispatchItemsModel> lines,
      List<DispatchItemsModel> newlines,
      DispatchBaggingModel form,
      DispatchItemsModel items,
      String? successMsg,
      Failure? error});

  $DispatchBaggingModelCopyWith<$Res> get form;
  $DispatchItemsModelCopyWith<$Res> get items;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$CreateDispatchStateCopyWithImpl<$Res, $Val extends CreateDispatchState>
    implements $CreateDispatchStateCopyWith<$Res> {
  _$CreateDispatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? lines = null,
    Object? newlines = null,
    Object? form = null,
    Object? items = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as DispatchView,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<DispatchItemsModel>,
      newlines: null == newlines
          ? _value.newlines
          : newlines // ignore: cast_nullable_to_non_nullable
              as List<DispatchItemsModel>,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as DispatchBaggingModel,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as DispatchItemsModel,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DispatchBaggingModelCopyWith<$Res> get form {
    return $DispatchBaggingModelCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DispatchItemsModelCopyWith<$Res> get items {
    return $DispatchItemsModelCopyWith<$Res>(_value.items, (value) {
      return _then(_value.copyWith(items: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateDispatchStateImplCopyWith<$Res>
    implements $CreateDispatchStateCopyWith<$Res> {
  factory _$$CreateDispatchStateImplCopyWith(_$CreateDispatchStateImpl value,
          $Res Function(_$CreateDispatchStateImpl) then) =
      __$$CreateDispatchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSuccess,
      DispatchView view,
      List<DispatchItemsModel> lines,
      List<DispatchItemsModel> newlines,
      DispatchBaggingModel form,
      DispatchItemsModel items,
      String? successMsg,
      Failure? error});

  @override
  $DispatchBaggingModelCopyWith<$Res> get form;
  @override
  $DispatchItemsModelCopyWith<$Res> get items;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$CreateDispatchStateImplCopyWithImpl<$Res>
    extends _$CreateDispatchStateCopyWithImpl<$Res, _$CreateDispatchStateImpl>
    implements _$$CreateDispatchStateImplCopyWith<$Res> {
  __$$CreateDispatchStateImplCopyWithImpl(_$CreateDispatchStateImpl _value,
      $Res Function(_$CreateDispatchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? lines = null,
    Object? newlines = null,
    Object? form = null,
    Object? items = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_$CreateDispatchStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as DispatchView,
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<DispatchItemsModel>,
      newlines: null == newlines
          ? _value._newlines
          : newlines // ignore: cast_nullable_to_non_nullable
              as List<DispatchItemsModel>,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as DispatchBaggingModel,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as DispatchItemsModel,
      successMsg: freezed == successMsg
          ? _value.successMsg
          : successMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$CreateDispatchStateImpl implements _CreateDispatchState {
  const _$CreateDispatchStateImpl(
      {required this.isLoading,
      required this.isSuccess,
      required this.view,
      required final List<DispatchItemsModel> lines,
      required final List<DispatchItemsModel> newlines,
      required this.form,
      required this.items,
      this.successMsg,
      this.error})
      : _lines = lines,
        _newlines = newlines;

  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final DispatchView view;
  final List<DispatchItemsModel> _lines;
  @override
  List<DispatchItemsModel> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  final List<DispatchItemsModel> _newlines;
  @override
  List<DispatchItemsModel> get newlines {
    if (_newlines is EqualUnmodifiableListView) return _newlines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newlines);
  }

  @override
  final DispatchBaggingModel form;
  @override
  final DispatchItemsModel items;
  @override
  final String? successMsg;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'CreateDispatchState(isLoading: $isLoading, isSuccess: $isSuccess, view: $view, lines: $lines, newlines: $newlines, form: $form, items: $items, successMsg: $successMsg, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDispatchStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.view, view) || other.view == view) &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            const DeepCollectionEquality().equals(other._newlines, _newlines) &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.items, items) || other.items == items) &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSuccess,
      view,
      const DeepCollectionEquality().hash(_lines),
      const DeepCollectionEquality().hash(_newlines),
      form,
      items,
      successMsg,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDispatchStateImplCopyWith<_$CreateDispatchStateImpl> get copyWith =>
      __$$CreateDispatchStateImplCopyWithImpl<_$CreateDispatchStateImpl>(
          this, _$identity);
}

abstract class _CreateDispatchState implements CreateDispatchState {
  const factory _CreateDispatchState(
      {required final bool isLoading,
      required final bool isSuccess,
      required final DispatchView view,
      required final List<DispatchItemsModel> lines,
      required final List<DispatchItemsModel> newlines,
      required final DispatchBaggingModel form,
      required final DispatchItemsModel items,
      final String? successMsg,
      final Failure? error}) = _$CreateDispatchStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  DispatchView get view;
  @override
  List<DispatchItemsModel> get lines;
  @override
  List<DispatchItemsModel> get newlines;
  @override
  DispatchBaggingModel get form;
  @override
  DispatchItemsModel get items;
  @override
  String? get successMsg;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$CreateDispatchStateImplCopyWith<_$CreateDispatchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
