import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_form.freezed.dart';
part 'purchase_order_form.g.dart';

@freezed
class PurchaseOrderForm with _$PurchaseOrderForm {
  const factory PurchaseOrderForm({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'supplier') String? supplier,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'modified') String? modified,
  }) = _PurchaseOrderForm;

  factory PurchaseOrderForm.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderFormFromJson(json);

        static List<String> fields = ['name'];
}

dynamic toNull(_) => null;


