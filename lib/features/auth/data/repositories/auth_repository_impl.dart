
import 'package:medb/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:medb/features/auth/data/models/login_response_model.dart';
import 'package:medb/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/errors/failures.dart';


class AuthRepositoryImpl implements AuthRepository {
  final ApiService _service;

  AuthRepositoryImpl(this._service);

  @override
  Future<LoginResponseModel> login({required String email, required String password}) async {
    try {
      return await _service.login(email, password);
    } on Failures catch (_) {
      rethrow;
    } catch (e) {
      throw ServerFailure("Unexpected error: ${e.toString()}");
    }
  }
}
