part of 'login_bloc_bloc.dart';

@immutable
abstract class LoginBlocEvent {}

final class LoginCredentailRequest extends LoginBlocEvent {
  final String email;
  final String password;

  LoginCredentailRequest({required this.email, required this.password});
}
