import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/empty_vehicle_tracking/model/empty_vehicle_form.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/app_text_styles.dart';
import 'package:alufluoride/widgets/app_spacer.dart';
import 'package:alufluoride/widgets/buttons/app_view_btn.dart';
import 'package:alufluoride/widgets/doc_status_widget.dart';
import 'package:alufluoride/widgets/spaced_column.dart';
import 'package:flutter/material.dart';

class EmptyVehicleTrackingWidget extends StatelessWidget {
  const EmptyVehicleTrackingWidget({
    super.key,
    required this.vehicleForm,
    required this.onTap,
  });

  final EmptyVehicleForm vehicleForm;
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
              side: const BorderSide(color:AppColors.registration, width: 2)),
          child: SpacedColumn(
            defaultHeight: 4,
            margin: const EdgeInsets.all(12),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(vehicleForm.name ?? '',
                      style: AppTextStyles.titleLarge(context)
                          .copyWith(color: AppColors.black)),
                          Text(DFU.ddMMyyyyFromStr(vehicleForm.date!),
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
                          StringUtils.docStatus(vehicleForm.docStatus ?? 0))
                ],
              ),
            ],
          )),
    );
  }
}
