import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/features/auth/data/datasources/auth_localstorage_datasource.dart';
import 'package:medb/features/auth/data/models/user_details_model.dart';

class UserDetailsCubit extends Cubit<UserModel?> {
  UserDetailsCubit() : super(null);

  void loadUserDetails() {
    emit(AuthService.userDetails);
  }

  void clearUserDetails() {
    emit(null);
  }
}
