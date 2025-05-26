import 'package:alufluoride/app/widgets/app_page_view2.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/invite_visitor/model/invite_visitor_form.dart';
import 'package:alufluoride/features/invite_visitor/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/invite_visitor/presentation/bloc/invite_visitor_filter_cubit.dart';
import 'package:alufluoride/features/invite_visitor/presentation/ui/widgets/invite_visitor_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:alufluoride/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InviteVisitorListScrn extends StatelessWidget {
  const InviteVisitorListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<InviteVisitorFilterCubit>(
      mode: PageMode2.inviteVisitor,
      onNew: () => AppRoute.newInviteVisitor.push(context),
      backgroundColor: AppColors.invite,
      scaffoldBg: AppIcons.bgFrame4.path,
      child: BlocListener<InviteVisitorFilterCubit, PageViewFilters>(
        listener: (context, state) => _fetchInitial(context),
        child:
            InfiniteListViewWidget<InviteVisitorListCubit, InviteVisitorForm>(
          childBuilder: (context, visitor) => InviteVisitorWidget(
            inviteVisitor: visitor,
            onTap: () =>
                AppRoute.newInviteVisitor.push<bool?>(context, extra: visitor),
          ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No Visitors Found.',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filter = context.read<InviteVisitorFilterCubit>().state;
    context.cubit<InviteVisitorListCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }

  void _fetchMore(BuildContext context) {
    final filter = context.read<InviteVisitorFilterCubit>().state;
    context
        .cubit<InviteVisitorListCubit>()
        .fetchMore(Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }
}
