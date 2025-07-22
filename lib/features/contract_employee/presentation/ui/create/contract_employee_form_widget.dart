import 'dart:developer';
import 'dart:io';

import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/contract_employee/data/static_data.dart';
import 'package:alufluoride/features/contract_employee/model/contractors_form.dart';
import 'package:alufluoride/features/contract_employee/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/contract_employee/presentation/bloc/create_contract_employee/contract_employee_cubit.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/widgets/app_spacer.dart';
import 'package:alufluoride/widgets/buttons/app_btn.dart';
import 'package:alufluoride/widgets/inputs/app_dropdown_widget.dart';
import 'package:alufluoride/widgets/inputs/compact_listtile.dart';
import 'package:alufluoride/widgets/inputs/date_selection_field.dart';
import 'package:alufluoride/widgets/inputs/input_filed.dart';
import 'package:alufluoride/widgets/inputs/photo_selection_widget.dart';
import 'package:alufluoride/widgets/inputs/search_dropdown_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class ContractEmployeeFormWidget extends StatefulWidget {
  const ContractEmployeeFormWidget({super.key});

  @override
  State<ContractEmployeeFormWidget> createState() =>
      _ContractEmployeeFormWidgetState();
}

class _ContractEmployeeFormWidgetState
    extends State<ContractEmployeeFormWidget> {
  final ScrollController _scrollController = ScrollController();
  bool isChecked = false;

  String? selectedSkillType;
  String? selectedGender;
  String? selectedContractorName;
  String? selectedSuppliergruop;
  final focusNodes = List.generate(60, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    final formState = context.read<CreateContractEmployeeCubit>().state;
    final isCreating = formState.view == ContractEmployeeView.create;
    final isCompleted = formState.view == ContractEmployeeView.completed;
    final newform = formState.form;
    log('----newform----:$newform');
    selectedSkillType = newform.skillType;
    selectedContractorName = newform.contractor;

    return MultiBlocListener(
      listeners: [
        BlocListener<CreateContractEmployeeCubit, CreateContractEmployeeState>(
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
      child: BlocBuilder<ContractorsList, ContractorsListState>(
        builder: (context, state) {
          final address = state.maybeWhen(
            orElse: () => <ContractorsForm>[],
            success: (data) => data.toList(),

            // data.where((e) => e.isContractor == true).toList(),
          );

          log('Address List: ${address}');

          return ListView(
            padding: const EdgeInsets.all(16),
            controller: _scrollController,
            children: [
              SearchDropDownList(
                color: AppColors.green,
                items: address,
                isMandatory: true,
                defaultSelection: address
                    .firstWhereOrNull((e) => e.name == newform.contractor),
                title: 'Contractor',
                readOnly: isCompleted,
                isloading: state.isLoading,
                futureRequest: (p0) async {
                  final filtered = address.where((e) {
                    final strList = [e.name].nonNulls.toList();
                    return strList
                        .caseInsensitiveSearch(p0, (str) => str)
                        .isNotEmpty;
                  }).toList();
                  return filtered;
                },
                headerBuilder: (_, item, __) => Text('${item.name}'),
                listItemBuilder: (_, e, __, ___) => CompactListTile(
                  title: '${e.name}',
                  subtitle: [e.supplierGroup].nonNulls.join(', '),
                ),
                onSelected: (address) {
                  setState(() {
                    selectedContractorName = address.name;
                    selectedSuppliergruop = address.supplierGroup;
                  });
                  context.cubit<CreateContractEmployeeCubit>().onValueChanged(
                        contractor: address.name,
                        supplierGroup: selectedSuppliergruop,
                      );
                },
                focusNode: focusNodes.elementAt(5),
              ),
              const SizedBox(height: 16),
              AppDropDownWidget(
                readOnly: isCompleted,
                color: AppColors.green,
                title: 'Skill Type',
                isMandatory: true,
                defaultSelection: newform.skillType,
                // key: ValueKey(selectedSkillType),
                items: AppStaticData.skillTypes,
                onSelected: (skilltype) {
                  setState(() {
                    selectedSkillType = skilltype;
                  });
                  context
                      .cubit<CreateContractEmployeeCubit>()
                      .onValueChanged(skillType: selectedSkillType);
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              InputField(
                title: 'Daily Wages',
                isRequired: true,
                readOnly: isCompleted,
                initialValue: newform.dailyWages != null
                    ? newform.dailyWages.toString()
                    : '',
                borderColor: AppColors.green,
                focusNode: focusNodes.elementAt(2),
                onChanged: (name) {
                  context
                      .cubit<CreateContractEmployeeCubit>()
                      .onValueChanged(dailyWages: int.tryParse(name));
                },
              ),
              const SizedBox(height: 16),
              AppDropDownWidget(
                readOnly: isCompleted,
                color: AppColors.green,
                title: 'Gender',
                isMandatory: true,
                defaultSelection: newform.gender,
                // key: ValueKey(selectedGender),
                items: AppStaticData.genders,
                onSelected: (genderss) {
                  setState(() {
                    selectedGender = genderss;
                  });
                  context
                      .cubit<CreateContractEmployeeCubit>()
                      .onValueChanged(genders: selectedGender);
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              InputField(
                title: 'Contract Employee Name',
                isRequired: true,
                readOnly: isCompleted,
                initialValue: newform.contractEmployee,
                maxLength: 40,
                borderColor: AppColors.green,
                focusNode: focusNodes.elementAt(4),
                onChanged: (p0) {
                  context
                      .cubit<CreateContractEmployeeCubit>()
                      .onValueChanged(contractEmployee: p0);
                },
              ),
              const SizedBox(height: 16),
              InputField(
                title: 'Aadhaar Number',
                isRequired: true,
                readOnly: isCompleted,
                initialValue: newform.aadhaar,
                maxLength: 12,
                borderColor: AppColors.green,
                focusNode: focusNodes.elementAt(6),
                inputType: TextInputType.phone,
                onChanged: (number) {
                  context
                      .cubit<CreateContractEmployeeCubit>()
                      .onValueChanged(aadhaar: number);
                },
              ),
              const SizedBox(height: 16),
              DateSelectionField(
                title: 'Date of Birth',
                initialValue: newform.dob,
                isRequired: true,
                readOnly: isCompleted,
                borderColor: AppColors.green,
                firstDate: DateTime(1980),
                lastDate: DFU.now(),
                onDateSelect: (date) {
                  final formattedDate = DateFormat('yyyy-MM-dd').format(date);
                  context
                      .cubit<CreateContractEmployeeCubit>()
                      .onValueChanged(dob: formattedDate);
                },
                suffixIcon: const Icon(Icons.calendar_month_outlined),
              ),
              const SizedBox(height: 16),
              InputField(
                title: 'PF',
                isRequired: true,
                initialValue: newform.pf,
                readOnly: isCompleted,
                maxLength: 12,
                borderColor: AppColors.green,
                focusNode: focusNodes.elementAt(7),
                inputType: TextInputType.phone,
                onChanged: (number) {
                  context
                      .cubit<CreateContractEmployeeCubit>()
                      .onValueChanged(pf: number);
                },
              ),
              InputField(
                title: 'ESI',
                readOnly: isCompleted,
                initialValue: newform.esi != null ? newform.esi.toString() : '',
                maxLength: 10,
                borderColor: AppColors.green,
                focusNode: focusNodes.elementAt(8),
                inputType: TextInputType.phone,
                onChanged: (p0) {
                  context
                      .cubit<CreateContractEmployeeCubit>()
                      .onValueChanged(esi: int.tryParse(p0));
                },
              ),
              const SizedBox(height: 16),
              PhotoSelectionWidget(
                isReadOnly: isCompleted,
                fileName: 'Attach',
                borderColor: AppColors.green,
                title: 'Photo',
                isRequired: true,
                defaultValue:
                    newform.photo != null ? File(newform.photo ?? '') : null,
                imageUrl: newform.photo,
                onFileCapture: (file) {
                  if (file != null) {
                    context
                        .cubit<CreateContractEmployeeCubit>()
                        .onValueChanged(photo: file);
                  }
                },
              ),
              const SizedBox(height: 16),
              AppSpacer.p32(),
              if (!isCompleted)
                BlocBuilder<CreateContractEmployeeCubit,
                    CreateContractEmployeeState>(
                  builder: (_, state) => AppButton(
                    label: isCreating ? 'Create' : 'Submit',
                    isLoading: state.isLoading,
                    bgColor: AppColors.haintBlue,
                    onPressed:
                        context.cubit<CreateContractEmployeeCubit>().save,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
