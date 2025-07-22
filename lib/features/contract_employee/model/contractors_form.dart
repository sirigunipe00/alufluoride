import 'package:freezed_annotation/freezed_annotation.dart';

part 'contractors_form.freezed.dart';
part 'contractors_form.g.dart';

@freezed
class ContractorsForm with _$ContractorsForm {
  const factory ContractorsForm({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'supplier_group') String? supplierGroup,
    @JsonKey(name: 'supplier_type') String? supplierType,
    @JsonKey(name: 'custom_is_contractor') int? isContractor,
  }) = _ContractorsForm;
  factory ContractorsForm.fromJson(Map<String, dynamic> json) =>
      _$ContractorsFormFromJson(json);

      static List<String> fields = ['name'];
          
}
