import 'package:alufluoride/app/presentation/app_update_blocprovider.dart';
import 'package:alufluoride/app/widgets/app_feature_widget.dart';
import 'package:alufluoride/app/widgets/app_page_view.dart';
import 'package:alufluoride/app/widgets/app_update_dailog.dart';
import 'package:alufluoride/core/app_router/app_route.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/app_text_styles.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      mode: PageMode.home,
      child: BlocListener<AppVersionCubit, AppVersionCubitState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: (data) {
              if (data) {
                showDialog(
                    context: context,
                    builder: (ctx) => const AppUpdateDialog(
                        appName: 'Alufluoride',
                        packageName: 'in.easycloud.alufluoride'),
                    barrierDismissible: false);
              }
            },
          );
        },
        child: GridView.count(
          padding: const EdgeInsets.all(12.0),
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 1,
          children: [
            AppFeatureWidget(
              icon: AppIcons.vechileEntry
                  .toWidget(height: 100, width: 120, fit: BoxFit.contain),
              title: Text('Gate Entry',
                  style: AppTextStyles.featureLabelStyle(context)),
              featureColor: AppColors.marigoldDDust,
              onTap: () => AppRoute.gateEntry.push(context),
            ),
            AppFeatureWidget(
              icon: AppIcons.vehcileExit
                  .toWidget(height: 100, width: 120, fit: BoxFit.contain),
              title: Text('Gate Exit',
                  style: AppTextStyles.featureLabelStyle(context)),
              featureColor: AppColors.shyMoment,
              onTap: () => AppRoute.gateExit.push(context),
            ),
            AppFeatureWidget(
              icon: AppIcons.baggingEntry
                  .toWidget(height: 100, width: 120, fit: BoxFit.fill),
              title: const Text(
                'Bagging Entry',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              featureColor: AppColors.invite,
              onTap: () => AppRoute.baggingEntry.push(context),
            ),
            AppFeatureWidget(
              icon: AppIcons.baggingEntry
                  .toWidget(height: 100, width: 120, fit: BoxFit.fill),
              title: const Text(
                'Bagging Dispatch',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              featureColor: AppColors.registration,
              onTap: () => AppRoute.baggingDispatch.push(context),
            ),
          ],
        ),
      ),
    );
  }
}
