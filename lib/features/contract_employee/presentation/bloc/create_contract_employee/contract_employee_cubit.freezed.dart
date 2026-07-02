// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_employee_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateContractEmployeeState {
  ContractEmployeeForm get form => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  ContractEmployeeView get view => throw _privateConstructorUsedError;
  String? get successMsg => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateContractEmployeeStateCopyWith<CreateContractEmployeeState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateContractEmployeeStateCopyWith<$Res> {
  factory $CreateContractEmployeeStateCopyWith(
          CreateContractEmployeeState value,
          $Res Function(CreateContractEmployeeState) then) =
      _$CreateContractEmployeeStateCopyWithImpl<$Res,
          CreateContractEmployeeState>;
  @useResult
  $Res call(
      {ContractEmployeeForm form,
      bool isLoading,
      bool isSuccess,
      ContractEmployeeView view,
      String? successMsg,
      Failure? error});

  $ContractEmployeeFormCopyWith<$Res> get form;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$CreateContractEmployeeStateCopyWithImpl<$Res,
        $Val extends CreateContractEmployeeState>
    implements $CreateContractEmployeeStateCopyWith<$Res> {
  _$CreateContractEmployeeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as ContractEmployeeForm,
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
              as ContractEmployeeView,
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
  $ContractEmployeeFormCopyWith<$Res> get form {
    return $ContractEmployeeFormCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
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
abstract class _$$CreateContractEmployeeStateImplCopyWith<$Res>
    implements $CreateContractEmployeeStateCopyWith<$Res> {
  factory _$$CreateContractEmployeeStateImplCopyWith(
          _$CreateContractEmployeeStateImpl value,
          $Res Function(_$CreateContractEmployeeStateImpl) then) =
      __$$CreateContractEmployeeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ContractEmployeeForm form,
      bool isLoading,
      bool isSuccess,
      ContractEmployeeView view,
      String? successMsg,
      Failure? error});

  @override
  $ContractEmployeeFormCopyWith<$Res> get form;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$CreateContractEmployeeStateImplCopyWithImpl<$Res>
    extends _$CreateContractEmployeeStateCopyWithImpl<$Res,
        _$CreateContractEmployeeStateImpl>
    implements _$$CreateContractEmployeeStateImplCopyWith<$Res> {
  __$$CreateContractEmployeeStateImplCopyWithImpl(
      _$CreateContractEmployeeStateImpl _value,
      $Res Function(_$CreateContractEmployeeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? form = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? view = null,
    Object? successMsg = freezed,
    Object? error = freezed,
  }) {
    return _then(_$CreateContractEmployeeStateImpl(
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as ContractEmployeeForm,
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
              as ContractEmployeeView,
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

class _$CreateContractEmployeeStateImpl
    implements _CreateContractEmployeeState {
  const _$CreateContractEmployeeStateImpl(
      {required this.form,
      required this.isLoading,
      required this.isSuccess,
      required this.view,
      this.successMsg,
      this.error});

  @override
  final ContractEmployeeForm form;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final ContractEmployeeView view;
  @override
  final String? successMsg;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'CreateContractEmployeeState(form: $form, isLoading: $isLoading, isSuccess: $isSuccess, view: $view, successMsg: $successMsg, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateContractEmployeeStateImpl &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.successMsg, successMsg) ||
                other.successMsg == successMsg) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, form, isLoading, isSuccess, view, successMsg, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateContractEmployeeStateImplCopyWith<_$CreateContractEmployeeStateImpl>
      get copyWith => __$$CreateContractEmployeeStateImplCopyWithImpl<
          _$CreateContractEmployeeStateImpl>(this, _$identity);
}

abstract class _CreateContractEmployeeState
    implements CreateContractEmployeeState {
  const factory _CreateContractEmployeeState(
      {required final ContractEmployeeForm form,
      required final bool isLoading,
      required final bool isSuccess,
      required final ContractEmployeeView view,
      final String? successMsg,
      final Failure? error}) = _$CreateContractEmployeeStateImpl;

  @override
  ContractEmployeeForm get form;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  ContractEmployeeView get view;
  @override
  String? get successMsg;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$CreateContractEmployeeStateImplCopyWith<_$CreateContractEmployeeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
