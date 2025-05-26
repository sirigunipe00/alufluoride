import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/Create%20Visit/model/create_visit_form.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/app_text_styles.dart';
import 'package:alufluoride/widgets/app_spacer.dart';
import 'package:alufluoride/widgets/buttons/app_view_btn.dart';
import 'package:alufluoride/widgets/doc_status_widget.dart';
import 'package:alufluoride/widgets/spaced_column.dart';
import 'package:flutter/material.dart';

class CreateVisitWidget extends StatelessWidget {
  const CreateVisitWidget({
    super.key,
    required this.onTap,
    required this.visit,
  });

  final CreateVisitForm visit;
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
              side: const BorderSide(color: AppColors.invite, width: 2)),
          child: SpacedColumn(
            defaultHeight: 4,
            margin: const EdgeInsets.all(12),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(visit.name.valueOrEmpty,
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                          Text(DFU.ddMMyyyyFromStr(visit.scheduledDate!),
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
                      status: visit.status.valueOrEmpty)
                ],
              ),
            ],
          )),
    );
  }
}
