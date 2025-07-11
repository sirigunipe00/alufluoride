import 'package:alufluoride/app/widgets/statusmenu_widget.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/cubit/base/filters_cubit.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/app_text_styles.dart';
import 'package:alufluoride/widgets/app_spacer.dart';
import 'package:alufluoride/widgets/buttons/go_back_widget.dart';
import 'package:alufluoride/widgets/inputs/simple_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum PageMode3 {
  gateentry('Gate Entry'),
  gateexit('Gate Exit'),
  gateregistration('Visitor Registration'),
  dipatchGaylord('Dispatch Gaylord'),
  poapprovallist('PO Approval List'),
  dashbaords('Dashbaords');

  final String name;
  const PageMode3(this.name);
}

class AppPageView3<T extends FiltersCubit> extends StatelessWidget {
  const AppPageView3({
    super.key,
    required this.mode,
    this.title,
    required this.scaffoldBg,
    required this.backgroundColor,
    required this.child,
    this.status = const [],
    this.onUpdateQuery,
    this.onUpdateStatus,
    this.hideFAB = false,
    this.onNew,
  });

  final String? title;
  final Widget child;
  final Color backgroundColor;
  final String scaffoldBg;
  final PageMode3 mode;
  final VoidCallback? onNew;
  final List<String> status;
  final ValueChanged<String>? onUpdateStatus;
  final ValueChanged<String?>? onUpdateQuery;

  final bool hideFAB;

  @override
  Widget build(BuildContext context) {
    T? cubit;
    try {
      cubit = context.read<T>();
    } catch (_) {}

    final hintText = switch (mode) {
      PageMode3.gateentry => 'Search Gate Entry - ID',
      PageMode3.gateexit => 'Search Gate Exit - ID',
      PageMode3.gateregistration => 'Search Reg- ID',
      PageMode3.dipatchGaylord => 'Serach Delivery Note - ID',
      PageMode3.poapprovallist => 'Search PO - ID',
      PageMode3.dashbaords => '',
    };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 52,
            top: -24,
            child: Image.asset(scaffoldBg),
          ),
          Positioned(
            left: 18,
            top: kToolbarHeight,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const GoBackWidget(),
                  AppSpacer.p8(),
                  Text(
                    title ?? mode.name,
                    style: AppTextStyles.titleLarge(context).copyWith(
                      color: AppColors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (mode != PageMode3.dashbaords) ...[
            Positioned(
              top: kToolbarHeight + 32,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    if (onUpdateQuery != null) ...[
                      Expanded(
                        child: SimpleSearchBar(
                          inputType: TextInputType.number,
                          initial: cubit?.state.query,
                          hintText: hintText,
                          onCancel: () => onUpdateQuery!(null),
                          onSearch: onUpdateQuery!,
                        ),
                      ),
                    ],
                    AppSpacer.p8(),
                    if (status.isNotEmpty && onUpdateStatus != null) ...[
                      Expanded(
                        flex: 1,
                        child: StatusMenuWidget(
                          defaultStatus: cubit?.state.status,
                          items: status,
                          onChange: onUpdateStatus!,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
          Positioned.fill(
            top: kToolbarHeight + 100,
            child: Container(
              width: context.sizeOfWidth,
              height: context.sizeOfHeight,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColors.pageViewColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                border: Border.all(color: AppColors.pageViewColor),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, -1),
                  )
                ],
              ),
              child: child,
            ),
          ),
        ],
      ),
      floatingActionButton: hideFAB.isTrue
          ? null
          : FloatingActionButton.extended(
              onPressed: onNew,
              backgroundColor: mode == PageMode3.gateregistration
                  ? AppColors.registration
                  : backgroundColor,
              extendedPadding: const EdgeInsets.symmetric(horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              elevation: 1,
              icon: const Icon(Icons.add, color: AppColors.white),
              label: Text(
                'New',
                style: AppTextStyles.titleLarge(context),
              ),
            ),
    );
  }
}
