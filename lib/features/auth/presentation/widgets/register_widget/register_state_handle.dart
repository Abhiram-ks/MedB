import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/common/custom_snackbar.dart';
import 'package:medb/core/routes/routes.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/presentation/state/cubit/progresser_cubit/progresser_cubit_cubit.dart';

import '../../state/bloc/register_bloc/register_bloc_bloc.dart';

void registerStateHandle(BuildContext context, RegisterBlocState state) {
  final bottonProgress = context.read<ProgresserCubitCubit>();

  if (state is RegisterGoToCredential) {
    Navigator.pushNamed(context, AppRoutes.credentials);
  } else if (state is RegisterConfirmationState) {
    showCupertinoDialog(
      context: context,
      builder:
          (dialogContext) => CupertinoAlertDialog(
            title: Text('Email Verification'),
            content: Text(
              'We’ve sent a verification link to ${state.emailId}. Please confirm your email before proceeding to the next step.',
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  'Varify',
                  style: TextStyle(color: AppPalette.buttonColor),
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  final registerBloc = context.read<RegisterBlocBloc>();
                  Future.delayed(Duration(milliseconds: 50), () {
                    registerBloc.add(CreateAnAccount());
                  });
                },
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  } else if (state is RegisterLoading) {
    bottonProgress.startLoading();
  } else if (state is RegisterSuccess) {
    bottonProgress.stopLoading();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  } else if (state is RegisterFailure) {
    bottonProgress.stopLoading();
    CustomSnackBar.show(
      context,
      message: 'Exception error occurred: ${state.error}',
      backgroundColor: AppPalette.redColor,
    );
  }
}
