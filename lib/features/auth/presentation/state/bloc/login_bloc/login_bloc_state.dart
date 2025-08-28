part of 'login_bloc_bloc.dart';

@immutable
abstract class LoginBlocState {}

final class LoginBlocInitial extends LoginBlocState {}

final class LoginLoadingState extends LoginBlocState {}
final class LoginBlocSuccess extends LoginBlocState {
  final LoginResponseModel user;

  LoginBlocSuccess(this.user);
}
final class LoginBlocFailure extends LoginBlocState {
  final String error;
  LoginBlocFailure({required this.error});
}