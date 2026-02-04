import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/contract_employee/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/contract_employee/presentation/bloc/contract_employee_filter.dart';
import 'package:alufluoride/features/contract_employee/presentation/bloc/create_contract_employee/contract_employee_cubit.dart';
import 'package:alufluoride/features/contract_employee/presentation/ui/create/contract_employee_form_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/widgets/dialogs/app_dialogs.dart';
import 'package:alufluoride/widgets/simple_app_bar.dart';
import 'package:alufluoride/widgets/title_status_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewContractEmployee extends StatefulWidget {
  const NewContractEmployee({super.key});

  @override
  State<NewContractEmployee> createState() => _NewContractEmployeeState();
}

class _NewContractEmployeeState extends State<NewContractEmployee> {
  @override
  Widget build(BuildContext context) {
    final contractEmployeeState =
        context.read<CreateContractEmployeeCubit>().state;

    final newform = contractEmployeeState.form;
    final status = newform.docStatus;
    final name = newform.name;
    final isNew = contractEmployeeState.view == ContractEmployeeView.create;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: isNew
          ? const SimpleAppBar(title: 'New Contract Employee')
          : TitleStatusAppBar(
              title: 'Contract Employee',
              docNo: name.valueOrEmpty,
              status: StringUtils.docStatus(status ?? 0),
              textColor: AppColors.green,
            ) as PreferredSizeWidget,
      body: BlocListener<CreateContractEmployeeCubit,
          CreateContractEmployeeState>(
        listener: (_, state) async {
          if (state.isSuccess && state.successMsg!.isNotNull) {
            await AppDialog.showSuccessDialog(
              context,
              title: 'Success',
              content: state.successMsg.valueOrEmpty,
              onTapDismiss: context.exit,
            ).then((_) {

              if (!context.mounted) return;
              context.cubit<CreateContractEmployeeCubit>().errorHandled();

              final contractEmployeesFilters =
                  context.read<ContractEmployeeFilterCubit>().state;

              context.cubit<ContractEmployeesCubit>().fetchInitial(
                    Pair(
                      StringUtils.docStatusInt(contractEmployeesFilters.status),
                      contractEmployeesFilters.query,
                    ),
                  );

              setState(() {});
            });
          }

          if (state.error.isNotNull) {
            await AppDialog.showErrorDialog(
              context,
              title: state.error!.title,
              content: state.error!.error,
              onTapDismiss: context.exit,
            );
            if (!context.mounted) return;
            context.cubit<CreateContractEmployeeCubit>().errorHandled();
          }
        },
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  ContractEmployeeBlocProvider.get().contractorsListCubit()
                    ..request(),
            ),
          ],
          child: ContractEmployeeFormWidget(key: ValueKey(status)),
        ),
      ),
    );
  }
}
