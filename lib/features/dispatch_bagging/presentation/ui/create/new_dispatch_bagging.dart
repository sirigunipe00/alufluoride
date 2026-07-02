import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/bloc/create_dispatch_cubit/create_dispatch_cubit.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/bloc/dispatch_filter_cubit.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/ui/create/dispatch_form_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/widgets/dialogs/app_dialogs.dart';
import 'package:alufluoride/widgets/simple_app_bar.dart';
import 'package:alufluoride/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewDispatchbagging extends StatefulWidget {
  const NewDispatchbagging({super.key});

  @override
  State<NewDispatchbagging> createState() => _NewDispatchbaggingState();
}

class _NewDispatchbaggingState extends State<NewDispatchbagging> {
  @override
  Widget build(BuildContext context) {
    final dispatchState = context.read<CreateDispatchCubit>().state;
    final newform = dispatchState.form;
    final status = newform.docstatus;
    final name = newform.name;

    final isNew = dispatchState.view == DispatchView.create;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: isNew
          ? const SimpleAppBar(title: 'New Bagging Dispatch')
          : TitleStatusAppBar(
              title: 'Bagging Dispatch',
              docNo: name.valueOrEmpty,
              status: StringUtils.docStatus(status ?? 0),
              textColor: AppColors.registration,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateDispatchCubit, CreateDispatchState>(
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
                context.cubit<CreateDispatchCubit>().errorHandled();
                context.cubit<CreateDispatchCubit>().addnewItem();
                final dispatchFilters =
                    context.read<DispatchFilterCubit>().state;
                context.cubit<DispatchBaggingCubit>().fetchInitial(Pair(
                    StringUtils.docStatusInt(dispatchFilters.status),
                    dispatchFilters.query));
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
            context.cubit<CreateDispatchCubit>().errorHandled();
          }
        },
       child: DispatchBaggingFormWidget(key: ValueKey(status)),
      ),
    );
  }
}
