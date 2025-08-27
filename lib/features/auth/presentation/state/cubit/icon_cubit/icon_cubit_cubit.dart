import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medb/core/themes/colors.dart';

part 'icon_cubit_state.dart';

class IconCubitCubit extends Cubit<IconCubitState> {
  IconCubitCubit() : super(IconCubitInitial());


  void togglePasswordVisibility(bool isVisible) {
    emit(PasswordVisibilityUpdated(!isVisible));
  }

  void updateIcon(bool isMaxLength) {
    emit(PhoneFiledColorUpdated(isMaxLength ? AppPalette.greenColor :  const Color.fromARGB(255, 152, 152, 152)));
  }
}
