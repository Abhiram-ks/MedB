part of 'register_bloc_bloc.dart';

@immutable
abstract class RegisterBlocState {}

final class RegisterBlocInitial extends RegisterBlocState {}


final class RegisterGoToCredential extends RegisterBlocState {}

final class RegisterConfirmationState extends RegisterBlocState {
  final String emailId;

  RegisterConfirmationState(this.emailId);
}

final class RegisterLoading extends RegisterBlocState {}
final class RegisterFailure extends RegisterBlocState {
  final String error;

  RegisterFailure({required this.error});
}


