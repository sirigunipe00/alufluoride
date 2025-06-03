import 'package:alufluoride/core/utils/date_format_util.dart';
import 'package:alufluoride/core/utils/string_utils.dart';
import 'package:alufluoride/features/incident_register/model/incident_register_form.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/app_text_styles.dart';
import 'package:alufluoride/widgets/app_spacer.dart';
import 'package:alufluoride/widgets/buttons/app_view_btn.dart';
import 'package:alufluoride/widgets/doc_status_widget.dart';
import 'package:alufluoride/widgets/spaced_column.dart';

import 'package:flutter/material.dart';

class IncidentRegisterWidget extends StatelessWidget {
  const IncidentRegisterWidget({
    super.key,
    required this.registerForm,
    required this.onTap,
  });

  final IncidentRegisterForm registerForm;
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
              side: const BorderSide(color: Color(0xFFC0C0C0), width: 2)),
          child: SpacedColumn(
            defaultHeight: 4,
            margin: const EdgeInsets.all(12),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(registerForm.name ?? '',
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                  Text(DFU.ddMMyyyyFromStr(registerForm.date!),
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
                      status:
                          StringUtils.docStatus(registerForm.docStatus ?? 0))
                ],
              ),
            ],
          )),
    );
  }
}
