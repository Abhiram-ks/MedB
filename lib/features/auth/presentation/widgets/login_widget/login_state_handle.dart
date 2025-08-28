import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/core/themes/colors.dart';
import 'package:medb/features/auth/presentation/state/bloc/login_bloc/login_bloc_bloc.dart';
import 'package:medb/features/auth/presentation/state/cubit/progresser_cubit/progresser_cubit_cubit.dart';

import '../../../../../core/common/custom_snackbar.dart';

void loginStateHandle(BuildContext context, LoginBlocState state) {
  final bottonProgress = context.read<ProgresserCubitCubit>();
  
  if(state is LoginLoadingState){
    bottonProgress.startLoading();
  }else if(state is LoginBlocSuccess){
    bottonProgress.stopLoading();
    CustomSnackBar.show(
      context,
      message: 'Successfully Login',
      backgroundColor: AppPalette.greenColor,
    );
  }else if (state is LoginBlocFailure){
    bottonProgress.stopLoading();
    CustomSnackBar.show(
      context,
      message: 'Exception error occurred: ${state.error}',
      backgroundColor: AppPalette.redColor,
    );
  }
}
