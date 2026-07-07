import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/production_baggging_entry/model/bagging_entry_model.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/app_text_styles.dart';
import 'package:alufluoride/widgets/app_spacer.dart';
import 'package:alufluoride/widgets/buttons/app_view_btn.dart';
import 'package:alufluoride/widgets/doc_status_widget.dart';
import 'package:alufluoride/widgets/spaced_column.dart';
import 'package:flutter/material.dart';

class BaggingEntryWidget extends StatelessWidget {
  const BaggingEntryWidget({
    super.key,
    required this.baggingEntry,
    required this.onTap,
  });

  final BaggingEntryModel baggingEntry;
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
              side: const BorderSide(color: AppColors.baggingEntry, width: 2)),
          child: SpacedColumn(
            defaultHeight: 1,
            margin: const EdgeInsets.all(10),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(baggingEntry.name!,
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                  Text(DFU.ddMMyyyyFromStr(baggingEntry.productionDate!),
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Batch : ${baggingEntry.batch ?? ''}', style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black.withValues(alpha: (0.7)))),
                Text('Shift : ${baggingEntry.shift ?? ''}', style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                ],
              ),
              AppSpacer.p4(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ViewBtn(onPressed: onTap),
                  DocStatusWidget(
                      status: StringUtils.docStatus(baggingEntry.docstatus!))
                ],
              ),
            ],
          )),
    );
  }
}
