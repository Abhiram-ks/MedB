import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:medb/core/errors/failures.dart';
import 'package:medb/features/dashbord/domain/repositories/logout_repository.dart';

part 'logout_bloc_event.dart';
part 'logout_bloc_state.dart';

class LogoutBlocBloc extends Bloc<LogoutBlocEvent, LogoutBlocState> {
  final LogoutRepository _repo;

  LogoutBlocBloc(this._repo) : super(LogoutBlocInitial()) {
    on<LogoutRequsted>((event, emit) {
      emit(LogoutAlertBoxState());
    });

    on<LogoutConfirm>((event, emit) async {
      emit(LogoutLoadingState());

      try {
        final response = await _repo.logOut();
        emit(LogoutSuccessState(response));
      } on Failures catch (failure) {
        emit(LogoutSuccessState(failure.message));
      } catch (e) {
        emit(LogoutSuccessState("Logout failed. $e Please try again."));
      }
    });
  }
}
