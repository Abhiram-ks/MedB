import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'progresser_cubit_state.dart';

class ProgresserCubitCubit extends Cubit<ProgresserCubitState> {
  ProgresserCubitCubit() : super(ProgresserCubitInitial());

  void startLoading() {
    emit(ButtonProgressStart());
  }

  void stopLoading() {
    emit(ButtonprogressStop());
  }
}
