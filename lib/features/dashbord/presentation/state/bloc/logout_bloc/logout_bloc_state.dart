part of 'logout_bloc_bloc.dart';

@immutable
abstract class LogoutBlocState {}

final class LogoutBlocInitial extends LogoutBlocState {}

final class LogoutAlertBoxState extends LogoutBlocState {}
final class LogoutLoadingState extends LogoutBlocState {}
final class LogoutSuccessState extends LogoutBlocState {
  final String message;
  LogoutSuccessState(this.message);
}
final class LogoutFailureState extends LogoutBlocState {
  final String message;
  LogoutFailureState(this.message);
}

