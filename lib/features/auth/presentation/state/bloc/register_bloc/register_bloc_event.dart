part of 'register_bloc_bloc.dart';

@immutable
abstract class RegisterBlocEvent {}

final class RegisterDetailsFormEvent extends RegisterBlocEvent {
  final String firstName;
  final String? middleName;
  final String? lastName;
  final String phoneNumber;

  RegisterDetailsFormEvent({required this.firstName,  this.middleName, this.lastName, required this.phoneNumber});
}

final class RegisterCredentialFormEvent extends RegisterBlocEvent {
  final String emailID;
  final String password;

  RegisterCredentialFormEvent({required this.emailID, required this.password});
}

class CreateAnAccount extends RegisterBlocEvent {}
