import 'package:bloc/bloc.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medb/features/auth/data/datasources/auth_localstorage_datasource.dart';
import 'package:medb/features/auth/data/models/menu_module_model.dart';

class MenuCubit extends Cubit<List<MenuModel>> {
  MenuCubit() : super([]);

  void loadMenuData() {
    if (AuthService.hasMenuData) {
      emit(AuthService.sortedModules);
    } else {
      emit([]);
    }
  }

  void clearMenuData() {
    emit([]);
  }
}
