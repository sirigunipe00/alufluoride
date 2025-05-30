import 'dart:developer';
import 'dart:io';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/gate_entry/data/static_data.dart';
import 'package:alufluoride/features/gate_entry/model/purchase_order_form.dart';
import 'package:alufluoride/features/gate_entry/model/vehicle_form.dart';
import 'package:alufluoride/features/gate_entry/model/vehicle_request_form.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/widgets/app_spacer.dart';
import 'package:alufluoride/widgets/buttons/app_btn.dart';
import 'package:alufluoride/widgets/inputs/app_dropdown_widget.dart';
import 'package:alufluoride/widgets/inputs/compact_listtile.dart';
import 'package:alufluoride/widgets/inputs/date_selection_field.dart';
import 'package:alufluoride/widgets/inputs/input_filed.dart';
import 'package:alufluoride/widgets/inputs/photo_selection_widget.dart';
import 'package:alufluoride/widgets/inputs/search_dropdown_list.dart';
import 'package:alufluoride/widgets/inputs/time_selection_field.dart';
import 'package:alufluoride/widgets/spaced_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
 
class GateEntryFormWidget extends StatefulWidget {
  const GateEntryFormWidget({super.key});

  @override
  State<GateEntryFormWidget> createState() => _GateEntryFormWidgetState();
}

class _GateEntryFormWidgetState extends State<GateEntryFormWidget> {
  final ScrollController _scrollController = ScrollController();
  bool isChecked = false;
  bool isBeforeWork = false;
  String? entryType;
  String? inTime;
  String? outTime;
  String? payType;

  final focusNodes = List.generate(60, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateGateEntryCubit>().state;
    final isCreating = formState.view == GateEntryView.create;
    final isCompleted = formState.view == GateEntryView.completed;
    final newform = formState.form;
    log('---newform---:${ newform}');
    entryType = newform.entryType;


    

    return MultiBlocListener(
      listeners: [
        BlocListener<CreateGateEntryCubit, CreateGateEntryState>(
          listenWhen: (previous, current) {
            final prevStatus = previous.error?.status;
            final currStatus = current.error?.status;
            return prevStatus != currStatus;
          },
          listener: (_, state) async {
            final indx = state.error?.status;
            if (indx != null) {
              final focus = focusNodes.elementAt(indx);
              FocusScope.of(context).requestFocus(focus);
              await Scrollable.ensureVisible(
                focus.context!,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        controller: _scrollController,
        child: SpacedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          margin: const EdgeInsets.all(12.0),
          defaultHeight: 8,
          children: [
            AppDropDownWidget(
              hint: 'Gate Entry Type',
              readOnly: isCompleted,
              color: AppColors.marigoldDDust,
              title: 'Gate Entry Type',
              isMandatory: true,
              defaultSelection: newform.entryType,
              key: ValueKey(entryType),
              items: AppStaticData.gateEntryType,
              onSelected: (entrytype) {
                setState(() {
                  entryType = entrytype;
                });
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(gateEntryType: entryType);
                setState(() {});
              },
            ),
            if (entryType == 'Purchase') ...[
              DateSelectionField(
                  title: 'Vendor Invoice Date',
                  initialValue: newform.vendorInvoiceDate,
                  isRequired: true,
                  readOnly: isCompleted,
                  firstDate: DFU.now(),
                  lastDate: DFU.now().add(const Duration(days: 365)),
                  onDateSelect: (date) {
                    final formattedDate = DateFormat('yyyy-MM-dd')
                        .format(date); // or your desired format
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(venorInvDate: formattedDate);
                  },
                  suffixIcon: const Icon(Icons.calendar_month_outlined)),
              BlocBuilder<PurchaseOrderList, PurchaseOrderListState>(
                builder: (_, state) {
                  final address = state.maybeWhen(
                    orElse: () => <PurchaseOrderForm>[],
                    success: (data) => data,
                  );

                  log('address:$address');
                  return SearchDropDownList(
                    key: UniqueKey(),
                    color: AppColors.marigoldDDust,
                    items: address,
                    defaultSelection: address
                        .where((e) {
                          return e.name == newform.poNumber;
                        })
                        .firstOrNull,
                    title: 'PO Number',
                    hint: 'PO Number',
                    readOnly: isCompleted,
                    isloading: state.isLoading,
                    futureRequest: (p0) async {
                      final where = address.where((e) {
                        final strList = [
                          e.name,
                        ].nonNulls.toList();
                        return strList
                            .caseInsensitiveSearch(p0, (str) => str)
                            .isNotEmpty;
                      });
                      return where.toList();
                    },
                    headerBuilder: (_, item, __) => Text('${item.name}'),
                    listItemBuilder: (_, e, __, ___) => CompactListTile(
                      title: '${e.name}',
                      subtitle: [
                        e.supplier,
                        e.status,
                      ].nonNulls.join(', '),
                    ),
                    onSelected: (address) {
                      context
                          .cubit<CreateGateEntryCubit>()
                          .onValueChanged(poNumber: address.name);
                    },
                    focusNode: focusNodes.elementAt(5),
                  );
                },
              ),
              InputField(
                title: 'Vendor Invoice Quantity',
                isRequired: true,
                readOnly: isCompleted,
                initialValue: newform.invoiceQnty != null ? newform.invoiceQnty.toString() : '',
                borderColor: AppColors.marigoldDDust,
                focusNode: focusNodes.elementAt(2),
                inputType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (p0) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(vendorInvQty: p0);
                },
              ),
              InputField(
                title: 'Invoice Amount',
                isRequired: true,
                readOnly: isCompleted,
                initialValue: newform.invoiceAmt != null ? newform.invoiceAmt.toString() : '',
                borderColor: AppColors.marigoldDDust,
                focusNode: focusNodes.elementAt(2),
                inputType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (p0) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(invAmt: p0);
                },
              ),
              InputField(
                title: 'Vehicle',
                isRequired: true,
                readOnly: isCompleted,
                initialValue: newform.vehicle1,
                borderColor: AppColors.marigoldDDust,
                focusNode: focusNodes.elementAt(2),
                inputType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (p0) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(vehicle: p0);
                },
              ),
              InputField(
                title: 'Vendor Invoice No',
                isRequired: true,
                readOnly: isCompleted,
                initialValue: newform.vendorInvNum,
                borderColor: AppColors.marigoldDDust,
                focusNode: focusNodes.elementAt(2),
                inputType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (p0) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(vendorInvNum: p0);
                },
              ),
              PhotoSelectionWidget(
                isReadOnly: isCompleted,
                fileName: 'Vendor Invoice Photo',
                borderColor: AppColors.marigoldDDust,
                title: 'Vendor Invoice Photo',
                isRequired: true,
                defaultValue: newform.vendorInvPhoto != null ? File(newform.vendorInvPhoto ?? '') : null,
                imageUrl: newform.vendorInvPhoto,
                onFileCapture: (file) {
                  if (file != null) {
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(venorInvPhoto: file.path);
                  }
                },
              ),
            ] else ...[
              BlocBuilder<VehicleRequestList, VehicleRequestListState>(
                builder: (_, state) {
                  final address = state.maybeWhen(
                    orElse: () => <VehcileRequestForm>[],
                    success: (data) => data,
                  );
                  return SearchDropDownList(
                    color: AppColors.marigoldDDust,
                    items: address,
                    key: UniqueKey(),
                    defaultSelection: address
                        .where((e) => e.name == newform.vehicleRequest)
                        .firstOrNull,
                    title: 'Vehicle Request',
                    hint: 'Vehicle Request',
                    readOnly: isCompleted,
                    isloading: state.isLoading,
                    futureRequest: (p0) async {
                      final where = address.where((e) {
                        final strList = [
                          e.name,
                        ].nonNulls.toList();
                        return strList
                            .caseInsensitiveSearch(p0, (str) => str)
                            .isNotEmpty;
                      });
                      return where.toList();
                    },
                    headerBuilder: (_, item, __) => Text('${item.name}'),
                    listItemBuilder: (_, e, __, ___) => CompactListTile(
                      title: '${e.name}',
                      subtitle: [
                        e.vehicleType,
                      ].nonNulls.join(', '),
                    ),
                    onSelected: (address) {
                      setState(() {
                        entryType = address.vehicleType;
                        inTime = address.inTime;
                        outTime = address.outTime;
                      });
                      context.cubit<CreateGateEntryCubit>().onValueChanged(
                          vehicleRequest: '${address.name}',
                          gateEntryType: entryType,
                          inTime: inTime,
                          outTime: outTime);
                    },
                    focusNode: focusNodes.elementAt(5),
                  );
                },
              ),
              BlocBuilder<VehicleList, VehicleListState>(
                builder: (_, state) {
                  final address = state.maybeWhen(
                    orElse: () => <VehcileForm>[],
                    success: (data) => data,
                  );
                  return SearchDropDownList(
                    key: UniqueKey(),
                    color: AppColors.marigoldDDust,
                    items: address,
                    defaultSelection: address
                        .where((e) => e.name == newform.vehicle)
                        .firstOrNull,
                    title: 'Vehicle',
                    hint: 'Vehicle',
                    readOnly: isCompleted,
                    isloading: state.isLoading,
                    futureRequest: (p0) async {
                      final where = address.where((e) {
                        final strList = [
                          e.name,
                        ].nonNulls.toList();
                        return strList
                            .caseInsensitiveSearch(p0, (str) => str)
                            .isNotEmpty;
                      });
                      return where.toList();
                    },
                    headerBuilder: (_, item, __) => Text('${item.name}'),
                    listItemBuilder: (_, e, __, ___) => CompactListTile(
                      title: '${e.name}',
                      subtitle: [
                        e.model,
                      ].nonNulls.join(', '),
                    ),
                    onSelected: (address) {
                      context
                          .cubit<CreateGateEntryCubit>()
                          .onValueChanged(vehicle: address.name);
                    },
                    focusNode: focusNodes.elementAt(5),
                  );
                },
              ),
              AppDropDownWidget(
                // key: UniqueKey(),
                defaultSelection: newform.payType,
                readOnly: isCompleted,
                title: 'Pay Type',
                hint: 'Select Pay Type',
                color: AppColors.marigoldDDust,
                items: const ['Hours', 'Qty'],
                focusNode: focusNodes.elementAt(7),
                onSelected: (value) {
                  setState(() {
                    payType = value;
                  });
                  
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(payType: value);
                },
              ),
              if(payType == 'Qty')...[
                 InputField(
                readOnly: isCompleted,
                title: 'Qty in Tonnes',
                borderColor: AppColors.marigoldDDust,
                inputType: TextInputType.number,
                initialValue: newform.perHrAmt,
                focusNode: focusNodes.elementAt(8),
                onChanged: (p0) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(qtyTonnes: int.tryParse(p0));
                },
              ),

               InputField(
                readOnly: isCompleted,
                title: 'Rate Per Tonnes',
                borderColor: AppColors.marigoldDDust,
                inputType: TextInputType.number,
                initialValue: newform.perHrAmt,
                focusNode: focusNodes.elementAt(8),
                onChanged: (p0) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(ratePerTonnes: double.tryParse(p0));
                },
              ),
              ] else...[
                TimeSelectionField(
                readOnly: isCompleted,
                key: UniqueKey(),
                // key: ValueKey(inTime),
                initialValue: newform.intime,
                borderColor: AppColors.marigoldDDust,
                title: 'In Time',
                onTimeSelect: (time) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(inTime: time.format(context));
                },
              ),
              TimeSelectionField(
                readOnly: isCompleted,
                // key: ValueKey(outTime),
                key: UniqueKey(),
                initialValue: newform.outTime,
                borderColor: AppColors.marigoldDDust,
                title: 'Out Time',
                onTimeSelect: (time) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(outTime: time.format(context));
                },
              ),
              InputField(
                readOnly: isCompleted,
                title: 'Per Hour Amount',
                borderColor: AppColors.marigoldDDust,
                inputType: TextInputType.number,
                initialValue: newform.perHrAmt,
                focusNode: focusNodes.elementAt(8),
                onChanged: (p0) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(perHrAmt: p0);
                },
              ),


              ],
              PhotoSelectionWidget(
                isReadOnly: isCompleted,
                fileName: 'Before Work',
                borderColor: AppColors.marigoldDDust,
                title: 'Before Work',
                isRequired: true,
                defaultValue: isCompleted ? File(newform.beforeWork ?? '') : null,
                imageUrl: newform.beforeWork,
                onFileCapture: (file) {
                  if (file != null) {
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(beforeWork: file.path);
                  }
                },
              ),

                  PhotoSelectionWidget(
                isReadOnly: isCompleted,
                fileName: 'After Work',
                borderColor: AppColors.marigoldDDust,
                title: 'After Work',
                isRequired: true,
                defaultValue: isCompleted ?  File(newform.afterWork ?? '') : null,
                imageUrl: newform.afterWork,
                onFileCapture: (file) {
                  if (file != null) {
                    context
                        .cubit<CreateGateEntryCubit>()
                        .onValueChanged(afterWork: file.path);
                  }
                },
              ),
              
            ],
            InputField(
              title: 'Gate Entry Date',
              isRequired: true,
              readOnly: isCompleted,
              initialValue: newform.gateEntryDate,
              borderColor: AppColors.marigoldDDust,
              focusNode: focusNodes.elementAt(2),
              inputType: const TextInputType.numberWithOptions(decimal: true),
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    // setState(() {
                    //   isChecked = value ?? false;
                    // });
                  },
                ),
                const Text('Is Purchase Receipt Created'),
              ],
            ),
            InputField(
              title: 'Driver Name',
              isRequired: true,
              readOnly: isCompleted,
              initialValue: newform.driverName,
              borderColor: AppColors.marigoldDDust,
              focusNode: focusNodes.elementAt(2),
              onChanged: (name) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(driverName: name);
              },
            ),
            InputField(
              title: 'Driver Mobile',
              isRequired: true,
              readOnly: isCompleted,
              maxLength: 10,
              initialValue: newform.drivermobileNo,
              borderColor: AppColors.marigoldDDust,
              focusNode: focusNodes.elementAt(4),
              inputType: TextInputType.phone,
              onChanged: (number) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(driverMobileNo: number);
              },
            ),
            const Divider(height: 1),
            PhotoSelectionWidget(
              isReadOnly: isCompleted,
              fileName: 'Vehicle Photo',
              borderColor: AppColors.marigoldDDust,
              title: 'Vehicle Photo',
              isRequired: true,
              defaultValue: isCompleted ? File(newform.vehiclePhoto ?? '') : null,
              imageUrl: newform.vehiclePhoto,
              onFileCapture: (file) {
                if (file != null) {
                  context
                      .cubit<CreateGateEntryCubit>()
                      .onValueChanged(vehiclephoto: file.path);
                }
              },
            ),
            InputField(
              readOnly: isCompleted,
              title: 'Remarks',
              borderColor: AppColors.marigoldDDust,
              inputType: TextInputType.multiline,
              maxLines: 3,
              initialValue: newform.remarks,
              focusNode: focusNodes.elementAt(11),
              onChanged: (p0) {
                context
                    .cubit<CreateGateEntryCubit>()
                    .onValueChanged(remarks: p0);
              },
            ),
            AppSpacer.p32(),
            if (!isCompleted)
              BlocBuilder<CreateGateEntryCubit, CreateGateEntryState>(
                builder: (_, state) => AppButton(
                  label: isCreating ? 'Create' : 'Submit',
                  isLoading: state.isLoading,
                  bgColor: AppColors.haintBlue,
                  onPressed: context.cubit<CreateGateEntryCubit>().save,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
