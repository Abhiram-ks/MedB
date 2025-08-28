import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medb/core/errors/failures.dart';
import 'package:medb/features/auth/data/models/login_response_model.dart';

import '../../../../domain/repositories/auth_repository.dart';
part 'login_bloc_event.dart';
part 'login_bloc_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  final AuthRepository _repository;

  LoginBlocBloc(this._repository) : super(LoginBlocInitial()) {

  on<LoginCredentailRequest>((event, emit) async {
  emit(LoginLoadingState());

  try {
   //final hashedPassword = HashFunction.generateHash(event.password);

    final user = await _repository.login(
      email: event.email, 
      password: event.password,
    );

    log('User login success: $user');
    emit(LoginBlocSuccess(user));

  } on Failures catch (failure) {
    log('Login failed: ${failure.message}');
    emit(LoginBlocFailure(error: failure.message));
  } catch (e) {
    log('Unexpected login error: $e');
    emit(LoginBlocFailure(error: "Login failed. Please try again."));
  }
});
  }
}
