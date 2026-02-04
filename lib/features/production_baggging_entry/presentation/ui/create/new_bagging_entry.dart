import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/bagging_entry_filter.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/blocprovider.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_bagging_entry_cubit/create_bagging_entry_cubit.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/ui/create/bagging_entry_form_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';

import 'package:alufluoride/widgets/dialogs/app_dialogs.dart';

import 'package:alufluoride/widgets/simple_app_bar.dart';
import 'package:alufluoride/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBaggingEntry extends StatefulWidget {
  const NewBaggingEntry({super.key});

  @override
  State<NewBaggingEntry> createState() => _NewBaggingEntryState();
}

class _NewBaggingEntryState extends State<NewBaggingEntry> {
  @override
  Widget build(BuildContext context) {
    final gateEntryState = context.read<CreateBaggingEntryCubit>().state;
    final newform = gateEntryState.form;
    final status = newform.docstatus;
    final name = newform.name;

    final isNew = gateEntryState.view == BaggingEntryView.create;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: isNew
          ? const SimpleAppBar(title: 'New Bagging Entry')
          : TitleStatusAppBar(
              title: 'Bagging Entry',
              docNo: name.valueOrEmpty,
              status: StringUtils.docStatus(status ?? 0),
              textColor: AppColors.invite,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateBaggingEntryCubit, CreateBaggingEntryState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg!.isNotNull) {

            AppDialog.showSuccessDialog(
              context,
              title: 'Success',
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then(
              (_) {
                if (!context.mounted) return;
                context.cubit<CreateBaggingEntryCubit>().errorHandled();
                context.cubit<CreateBaggingEntryCubit>().addnewItem();
                final gateEntryFilters =
                    context.read<BaggingEntryFilterCubit>().state;
                context.cubit<BaggingEntryCubit>().fetchInitial(Pair(
                    StringUtils.docStatusInt(gateEntryFilters.status),
                    gateEntryFilters.query));
                setState(() {});
              },
            );
          }
          if (state.error.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              title: state.error!.title,
              content: state.error!.error,
              onTapDismiss: context.exit,
            );

            if (!context.mounted) return;
            context.cubit<CreateBaggingEntryCubit>().errorHandled();
          }
        },
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  GateEntryBlocProvider.get().vehicleRequestCubit()..request(),
            ),
            BlocProvider(
              create: (context) =>
                  GateEntryBlocProvider.get().vehicleListCubit()..request(),
            ),
            BlocProvider(
              create: (context) =>
                  GateEntryBlocProvider.get().purchaseOrderListCubit()
                    ..request(),
            ),
          ],
          child: BaggingEntryFormWidget(key: ValueKey(status)),
        ),
      ),
    );
  }
}
