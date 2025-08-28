

import 'package:flutter/material.dart';
import 'package:medb/core/routes/routes.dart';
import 'package:medb/features/auth/presentation/state/bloc/splash_bloc/splash_bloc_bloc.dart';

void splashStateHandle(BuildContext context, SplashBlocState state) {
  if (state is SplashBlocGoToLogin) {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }else if (state is SplashBlocGoToDashBord){
    Navigator.pushReplacementNamed(context, AppRoutes.dashbord );
  }
}
