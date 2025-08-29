import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medb/features/auth/data/datasources/auth_localstorage_datasource.dart';

part 'splash_bloc_event.dart';
part 'splash_bloc_state.dart';

class SplashBlocBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  SplashBlocBloc() : super(SplashBlocInitial()) {
    on<SplashEventRequest>((event, emit) async {

      await Future.delayed(const Duration(seconds: 3));
      if (AuthService.isLoggedIn) {

        final isValid = await _checkTokenValidity();
        if (isValid) {
          emit(SplashBlocGoToDashBord());
        } else {
          await AuthService.clearLoginCredentials();
          emit(SplashBlocGoToLogin());
        }
      } else {
        emit(SplashBlocGoToLogin());
      }
    });
  }

  Future<bool> _checkTokenValidity() async {
    try {
      final token = AuthService.isLoggedIn;
      log('printing token: $token');
      if (!token) return false;
      return true; 
    } catch (_) {
      return false;
    }
  }
}
