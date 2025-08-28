
import 'package:dio/dio.dart';

class RegisterRemoteDatasource {
  final Dio dio;

  RegisterRemoteDatasource(this.dio);

  Future<void> registerUser ({
    required String firstName,
    String? middleName,
    String? lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final respose = await dio.post( "https://testapi.medb.co.in/api/auth/register",
    data: {
      "firstName": firstName,
      "middleName": middleName,
      "lastName": lastName,
      "email": email,
      "contactNo": phone,
      "password": password,
      "confirmPassword": password,
    },
    options: Options(
      headers: {
       "Content-Type": "application/json",
       "Accept": "application/json",
      }
    )
    );
    if(respose.statusCode != 200 && respose.statusCode != 201){
      throw DioException(
      requestOptions: respose.requestOptions,
      response: respose,
      type: DioExceptionType.badResponse);
    }
  }
}