import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'splash_bloc_event.dart';
part 'splash_bloc_state.dart';

class SplashBlocBloc extends Bloc<SplashBlocEvent, SplashBlocState> {
  SplashBlocBloc() : super(SplashBlocInitial()) {
    on<SplashEventRequest>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashBlocGoToLogin());
    });
  }
}
