
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/routes/routes.dart';
import 'package:medb/features/auth/presentation/state/cubit/progresser_cubit/progresser_cubit_cubit.dart';
import 'package:medb/features/dashbord/presentation/state/logout_bloc/logout_bloc_bloc.dart';

import '../../../../../core/common/custom_snackbar.dart';
import '../../../../../core/themes/colors.dart';

void logoutStateHandle(BuildContext context, LogoutBlocState state) {
  final bottonProgress = context.read<ProgresserCubitCubit>();

  if (state is LogoutSuccessState) {
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
  } else if (state is LogoutAlertBoxState) {
    showCupertinoDialog(
      context: context,
      builder:
          (dialogContext) => CupertinoAlertDialog(
            title: Text('Session Logout'),
            content: Text(
              'Are you sure you want to log out? ',
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  'Yes, Logout',
                  style: TextStyle(color: AppPalette.buttonColor),
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  final registerBloc = context.read<LogoutBlocBloc>();
                  Future.delayed(Duration(milliseconds: 50), () {
                    registerBloc.add(LogoutConfirm());
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
  } else if (state is LogoutLoadingState){
    CustomSnackBar.show(
      context,
      message:"Logout request is being processed. You will be automatically logged out from this device once it’s completed. Please wait…",
      backgroundColor: AppPalette.buttonColor,
    );
  }
  else if (state is LogoutFailureState) {
    bottonProgress.stopLoading();
    CustomSnackBar.show(
      context,
      message: 'Exception error occurred: ${state.message}',
      backgroundColor: AppPalette.redColor,
    );
  }
}
