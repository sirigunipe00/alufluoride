import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/create_gate_exit/create_gate_exit_cubit.dart';
import 'package:alufluoride/features/gate_exit/presentation/ui/create/widget/gate_exit_form_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/widgets/app_error_widget.dart';
import 'package:alufluoride/widgets/dialogs/app_dialogs.dart';
import 'package:alufluoride/widgets/loading_indicator.dart';
import 'package:alufluoride/widgets/simple_app_bar.dart';
import 'package:alufluoride/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewGateExit extends StatefulWidget {
  const NewGateExit({super.key});

  @override
  State<NewGateExit> createState() => _NewGateExitState();
}

class _NewGateExitState extends State<NewGateExit> {
  @override
  Widget build(BuildContext context) {
    final gateExitState = context.read<CreateGateExitCubit>().state;
    final form = gateExitState.form;
    final status = form.status;
    final name = form.name;
    final isNew = gateExitState.view == GateExitView.create;

    return Scaffold(
      appBar: isNew
          ? const SimpleAppBar(title: 'New Gate Exit')
          : TitleStatusAppBar(
              title: 'Gate Exit',
              docNo: name.valueOrEmpty,
              status: status.valueOrEmpty,
              textColor: AppColors.shyMoment,
            ) as PreferredSizeWidget,
      backgroundColor: AppColors.white,
      body: BlocListener<CreateGateExitCubit, CreateGateExitState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg.isNotNull) {
            AppDialog.showSuccessDialog(
              context,
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            );
            context.cubit<GateExitsCubit>().fetchInitial(PageViewFilters.initial());
            setState(() {});
          }
          if (state.error.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              title: state.error!.title,
              content: state.error!.error,
              onTapDismiss: context.exit,
            );
            if (!context.mounted) return;
            context.cubit<CreateGateExitCubit>().errorHandled();
            return;
          }
        },
        child: BlocConsumer<GateExitDetails, GateExitDetailsState>(
          listener: (_, state) {
            state.maybeWhen(
              success: (data) {
                context.cubit<CreateGateExitCubit>().initDetails(data);
                setState(() {});
              },
              orElse: () {},
            );
          },
          builder: (_, state) {
            return state.maybeWhen(
              orElse: () => SingleChildScrollView(child: GateExitFormWidget(key: ValueKey(status))),
              loading: () => const Center(child: LoadingIndicator()),
              failure: (failure) => AppErrorWidget(error: failure.error),
            );
          },
        ),
      ),
    );
  }
}
