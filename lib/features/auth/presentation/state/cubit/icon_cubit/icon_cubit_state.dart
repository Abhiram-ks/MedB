part of 'icon_cubit_cubit.dart';

@immutable
abstract class IconCubitState {}

final class IconCubitInitial extends IconCubitState {}

final class PasswordVisibilityUpdated extends IconCubitState {
  final bool isVisible;

  PasswordVisibilityUpdated(this.isVisible);
}
