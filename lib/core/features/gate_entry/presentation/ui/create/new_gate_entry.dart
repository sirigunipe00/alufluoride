import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/gate_entry_filter_cubit.dart';
import 'package:alufluoride/features/gate_entry/presentation/ui/create/gate_entry_form_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';

import 'package:alufluoride/widgets/dialogs/app_dialogs.dart';

import 'package:alufluoride/widgets/simple_app_bar.dart';
import 'package:alufluoride/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewGateEntry extends StatefulWidget {
  const NewGateEntry({super.key});

  @override
  State<NewGateEntry> createState() => _NewGateEntryState();
}

class _NewGateEntryState extends State<NewGateEntry> {
  @override
  Widget build(BuildContext context) {
    final gateEntryState = context.read<CreateGateEntryCubit>().state;
    final newform = gateEntryState.form;
    final status = newform.docStatus;
    final name = newform.name;

    final isNew = gateEntryState.view == GateEntryView.create;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: isNew
          ? const SimpleAppBar(title: 'New Gate Entry')
          : TitleStatusAppBar(
              title: 'Gate Entry',
              docNo: name.valueOrEmpty,
              status: StringUtils.docStatus(status ?? 0),
              textColor: AppColors.marigoldDDust,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateGateEntryCubit, CreateGateEntryState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg!.isNotNull) {
            AppDialog.showSuccessDialog(
              context,
              title: 'Success',
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then(
              (_) {
                 final docName = state.form.name;
                if (!context.mounted) return;
                context.cubit<CreateGateEntryCubit>().errorHandled();
                context.cubit<GateEntryLinesCubit>().request(docName);
                  final gateEntryFilters =
                context.read<GateEntryFilterCubit>().state;
                context
                    .cubit<GateEntriesCubit>()
                    .fetchInitial(Pair(StringUtils.docStatusInt(gateEntryFilters.status), gateEntryFilters.query));
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
            if(!context.mounted) return;
            context.cubit<CreateGateEntryCubit>().errorHandled();
          }
        },
        child: GateEntryFormWidget(key: ValueKey(status)),
      ),
    );
  }
}
