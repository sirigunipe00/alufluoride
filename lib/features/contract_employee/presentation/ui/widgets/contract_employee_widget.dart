import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/contract_employee/model/contract_employee_form.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/app_text_styles.dart';
import 'package:alufluoride/widgets/app_spacer.dart';
import 'package:alufluoride/widgets/buttons/app_view_btn.dart';
import 'package:alufluoride/widgets/doc_status_widget.dart';
import 'package:alufluoride/widgets/spaced_column.dart';
import 'package:flutter/material.dart';

class ContractEmployeeWidget extends StatelessWidget {
  const ContractEmployeeWidget({
    super.key,
    required this.contractEmployee,
    required this.onTap,
  });

  final ContractEmployeeForm contractEmployee;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: AppColors.white,
          surfaceTintColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: AppColors.green, width: 2)),
          child: SpacedColumn(
            defaultHeight: 4,
            margin: const EdgeInsets.all(12),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(contractEmployee.name ?? '',
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                  Text(
                      DFU.ddMMyyyyFromStr(
                          contractEmployee.creation ?? " "),
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                ],
              ),
              AppSpacer.p8(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ViewBtn(onPressed: onTap),
                  DocStatusWidget(
                      status: StringUtils.docStatus(
                          contractEmployee.docStatus ?? 0)),
                ],
              ),
            ],
          )),
    );
  }
}
