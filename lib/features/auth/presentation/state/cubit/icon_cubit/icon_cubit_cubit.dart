import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'icon_cubit_state.dart';

class IconCubitCubit extends Cubit<IconCubitState> {
  IconCubitCubit() : super(IconCubitInitial());


  void togglePasswordVisibility(bool isVisible) {
    emit(PasswordVisibilityUpdated(!isVisible));
  }
}
