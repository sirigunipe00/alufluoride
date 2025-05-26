import 'package:alufluoride/app/widgets/app_page_view2.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/visitor_in_out/model/visitor_in_out_form.dart';
import 'package:alufluoride/features/visitor_in_out/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/visitor_in_out/presentation/bloc/visitor_in_out_filter_cubit.dart';
import 'package:alufluoride/features/visitor_in_out/presentation/ui/widgets/visitor_in_out_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:alufluoride/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitorInOutListScrn extends StatelessWidget {
  const VisitorInOutListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<VisitorInOutFilterCubit>(
      mode: PageMode2.visitorInOut,
      onNew: () => AppRoute.newVisitorInOut.push(context),
      backgroundColor: AppColors.registration,
      scaffoldBg: AppIcons.bgFrame5.path,
      child: BlocListener<VisitorInOutFilterCubit, PageViewFilters>(
        listener: (context, state) => _fetchInitial(context),
        child: InfiniteListViewWidget<VisitorInOutListCubit, VisitorInOutForm>(
          childBuilder: (context, visitor) => VisitorInOutWidget(
            visitorInOut: visitor,
            onTap: () =>
                AppRoute.newVisitorInOut.push<bool?>(context, extra: visitor),
          ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No Visitor In Outs Found.',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filter = context.read<VisitorInOutFilterCubit>().state;
    context.cubit<VisitorInOutListCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }

  void _fetchMore(BuildContext context) {
    final filter = context.read<VisitorInOutFilterCubit>().state;
    context
        .cubit<VisitorInOutListCubit>()
        .fetchMore(Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }
}
