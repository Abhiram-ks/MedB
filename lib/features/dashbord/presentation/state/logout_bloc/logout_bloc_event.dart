part of 'logout_bloc_bloc.dart';

@immutable
abstract class LogoutBlocEvent {}

final class LogoutRequsted extends LogoutBlocEvent {}
final class LogoutConfirm extends LogoutBlocEvent {}
