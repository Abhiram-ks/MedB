import 'package:medb/core/errors/error_mapper.dart';
import 'package:medb/core/errors/failures.dart';
import 'package:medb/features/auth/data/datasources/register_remote_datasource.dart';

class RegisterRepository {
  final RegisterRemoteDatasource _remoteDatasource;

  RegisterRepository(this._remoteDatasource);
  
  Future<Failures?> registerUser({
    required String firstName,
    String? middleName,
    String? lastName,
    required String email,
    required String phone,
    required String password
  }) async {
    try {
      await _remoteDatasource.registerUser(
        firstName: firstName, 
        middleName: middleName,
        lastName: lastName,
        email: email,
        phone: phone, 
        password: password);
      return null; //success state
    } catch (e) {
      return ErrorMapper.mapError(e);
    }
  }
}