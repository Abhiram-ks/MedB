
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medb/features/auth/domain/usecases/register_user_usecase.dart';

import '../../../../../../core/hash/hash_function.dart';
part 'register_bloc_event.dart';
part 'register_bloc_state.dart';

class RegisterBlocBloc extends Bloc<RegisterBlocEvent, RegisterBlocState> {
  final RegisterUser _registerUser;
  //  Private variable (only accessible inside this library/file)
  String _firstName = '';
  String? _middleName;
  String? _lastName = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';

  String get firstName => _firstName;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get password => _password;

  RegisterBlocBloc(this._registerUser) : super(RegisterBlocInitial()) {
   //Used to gather essential client information.
    on<RegisterDetailsFormEvent>((event, emit) {
      _firstName = event.firstName;
      _middleName = event.middleName;
      _lastName = event.lastName;
      _phoneNumber = event.phoneNumber;
      emit(RegisterGoToCredential());
    });
   
    // Collects user login credentials
    on<RegisterCredentialFormEvent>((event, emit) {
      _email = event.emailID;
      _password = event.password;

      emit(RegisterConfirmationState(event.emailID));
    });

    on<CreateAnAccount>((event, emit) async{
      emit(RegisterLoading());

      try {
       // final hashedPassword = HashFunction.generateHash(_password);

        final failure  = await _registerUser.call(
          firstName: _firstName,
          middleName: _middleName ?? '',
          lastName: _lastName ?? '',
          email: _email, 
          phone: _phoneNumber, 
          password: _password,
          );

          if (failure == null) {
            emit(RegisterSuccess());
          }else {
            emit(RegisterFailure(error: failure.message));
          }
      } catch (e) {
         emit(RegisterFailure(error: 'Unexpected error occurred. Please try again. $e'));
      }
    });
  }
}
