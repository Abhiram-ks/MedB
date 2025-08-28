import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'logout_bloc_event.dart';
part 'logout_bloc_state.dart';

class LogoutBlocBloc extends Bloc<LogoutBlocEvent, LogoutBlocState> {
  LogoutBlocBloc() : super(LogoutBlocInitial()) {
    on<LogoutBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
