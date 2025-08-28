import 'package:medb/core/errors/failures.dart';
import 'package:medb/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:medb/features/dashbord/domain/repositories/logout_repository.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  final ApiService _service;

  LogoutRepositoryImpl(this._service);

  @override
  Future<String> logOut() async{
   try {
     return await _service.logout();
   } on Failures catch (_){
     rethrow;
   } catch (e) {
    throw ServerFailure("Unexpected error: ${e.toString()}");
   }
  }
  
}