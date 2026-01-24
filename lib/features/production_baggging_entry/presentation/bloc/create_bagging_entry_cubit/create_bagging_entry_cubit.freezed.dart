// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_bagging_entry_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateBaggingEntryState {
  BaggingEntryModel get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  BaggingEntryView get view => throw _privateConstructorUsedError;
  List<ItemModel> get lines => throw _privateConstructorUsedError;
  List<ItemModel> get newlines => throw _privateConstructorUsedError;
  ItemModel get items => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  /// Create a copy of CreateBaggingEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateBaggingEntryStateCopyWith<CreateBaggingEntryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBaggingEntryStateCopyWith<$Res> {
  factory $CreateBaggingEntryStateCopyWith(CreateBaggingEntryState value,
          $Res Function(CreateBaggingEntryState) then) =
      _$CreateBaggingEntryStateCopyWithImpl<$Res, CreateBaggingEntryState>;
  @useResult
  $Res call(
      {BaggingEntryModel form,
      bool isLoading,
      bool isSuccess,
      BaggingEntryView view,
      List<ItemModel> lines,
      List<ItemModel> newlines,
      ItemModel items,
      String? successMsg,
      Failure? error});

  $BaggingEntryModelCopyWith<$Res> get form;
  $ItemModelCopyWith<$Res> get items;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$CreateBaggingEntryStateCopyWithImpl<$Res,
        $Val extends CreateBaggingEntryState>
    implements $CreateBaggingEntryStateCopyWith<$Res> {
  _$CreateBaggingEntryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBaggingEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? lines = null,
    Object? newlines = null,
    Object? items = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as BaggingEntryModel,
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
              as BaggingEntryView,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      newlines: null == newlines
          ? _value.newlines
          : newlines // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as ItemModel,
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

  /// Create a copy of CreateBaggingEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaggingEntryModelCopyWith<$Res> get form {
    return $BaggingEntryModelCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }

  /// Create a copy of CreateBaggingEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemModelCopyWith<$Res> get items {
    return $ItemModelCopyWith<$Res>(_value.items, (value) {
      return _then(_value.copyWith(items: value) as $Val);
    });
  }

  /// Create a copy of CreateBaggingEntryState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$CreateBaggingEntryStateImplCopyWith<$Res>
    implements $CreateBaggingEntryStateCopyWith<$Res> {
  factory _$$CreateBaggingEntryStateImplCopyWith(
          _$CreateBaggingEntryStateImpl value,
          $Res Function(_$CreateBaggingEntryStateImpl) then) =
      __$$CreateBaggingEntryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaggingEntryModel form,
      bool isLoading,
      bool isSuccess,
      BaggingEntryView view,
      List<ItemModel> lines,
      List<ItemModel> newlines,
      ItemModel items,
      String? successMsg,
      Failure? error});

  @override
  $BaggingEntryModelCopyWith<$Res> get form;
  @override
  $ItemModelCopyWith<$Res> get items;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$CreateBaggingEntryStateImplCopyWithImpl<$Res>
    extends _$CreateBaggingEntryStateCopyWithImpl<$Res,
        _$CreateBaggingEntryStateImpl>
    implements _$$CreateBaggingEntryStateImplCopyWith<$Res> {
  __$$CreateBaggingEntryStateImplCopyWithImpl(
      _$CreateBaggingEntryStateImpl _value,
      $Res Function(_$CreateBaggingEntryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateBaggingEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? lines = null,
    Object? newlines = null,
    Object? items = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_$CreateBaggingEntryStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as BaggingEntryModel,
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
              as BaggingEntryView,
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      newlines: null == newlines
          ? _value._newlines
          : newlines // ignore: cast_nullable_to_non_nullable
              as List<ItemModel>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as ItemModel,
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

class _$CreateBaggingEntryStateImpl implements _CreateBaggingEntryState {
  const _$CreateBaggingEntryStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      required this.view,
      required final List<ItemModel> lines,
      required final List<ItemModel> newlines,
      required this.items,
      this.successMsg,
      this.error})
      : _lines = lines,
        _newlines = newlines;

  @override
  final BaggingEntryModel form;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final BaggingEntryView view;
  final List<ItemModel> _lines;
  @override
  List<ItemModel> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  final List<ItemModel> _newlines;
  @override
  List<ItemModel> get newlines {
    if (_newlines is EqualUnmodifiableListView) return _newlines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newlines);
  }

  @override
  final ItemModel items;
  @override
  final String? successMsg;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'CreateBaggingEntryState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, view: $view, lines: $lines, newlines: $newlines, items: $items, successMsg: $successMsg, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBaggingEntryStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.view, view) || other.view == view) &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            const DeepCollectionEquality().equals(other._newlines, _newlines) &&
            (identical(other.items, items) || other.items == items) &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      form,
      isLoading,
      isSuccess,
      view,
      const DeepCollectionEquality().hash(_lines),
      const DeepCollectionEquality().hash(_newlines),
      items,
      successMsg,
      error);

  /// Create a copy of CreateBaggingEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBaggingEntryStateImplCopyWith<_$CreateBaggingEntryStateImpl>
      get copyWith => __$$CreateBaggingEntryStateImplCopyWithImpl<
          _$CreateBaggingEntryStateImpl>(this, _$identity);
}

abstract class _CreateBaggingEntryState implements CreateBaggingEntryState {
  const factory _CreateBaggingEntryState(
      {required final BaggingEntryModel form,
      required final bool isLoading,
      required final bool isSuccess,
      required final BaggingEntryView view,
      required final List<ItemModel> lines,
      required final List<ItemModel> newlines,
      required final ItemModel items,
      final String? successMsg,
      final Failure? error}) = _$CreateBaggingEntryStateImpl;

  @override
  BaggingEntryModel get form;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  BaggingEntryView get view;
  @override
  List<ItemModel> get lines;
  @override
  List<ItemModel> get newlines;
  @override
  ItemModel get items;
  @override
  String? get successMsg;
  @override
  Failure? get error;

  /// Create a copy of CreateBaggingEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBaggingEntryStateImplCopyWith<_$CreateBaggingEntryStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
