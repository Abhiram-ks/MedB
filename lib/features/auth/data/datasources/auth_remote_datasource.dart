
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:medb/core/errors/failures.dart';
import 'package:medb/features/auth/data/datasources/auth_localstorage_datasource.dart';
import 'package:medb/features/auth/data/models/login_response_model.dart';

import '../../../../core/errors/error_mapper.dart';

class ApiService {
  late Dio _dio;
  CookieJar? _cookieJar;

  static const String baseUrl = 'https://testapi.medb.co.in/api/auth';

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if(!kIsWeb){
      _cookieJar = CookieJar();
      _dio.interceptors.add(CookieManager(_cookieJar!));
     }
  

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final accessToken = AuthService.accessToken;
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          handler.next(options);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          try {

            if (e.response?.statusCode == 401) {
              await AuthService.clearLoginData();
            }

            handler.reject(
              DioException(
                requestOptions: e.requestOptions,
                error: e,
                response: e.response,
                type: e.type,
              ),
            );
          } catch (ex) {
            handler.next(e);
          }
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
      ),
    );
  }
   
  Future<LoginResponseModel> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200 && response.data != null) {
      
        final loginResponse = LoginResponseModel.fromJson(response.data);

        await AuthService.storeLoginData(loginResponse);
        return loginResponse;
      } else {
        throw ServerFailure("Login failed: ${response.statusCode}");
      }
    } on DioException catch (dioError) {
      throw ErrorMapper.mapError(dioError);
    } catch (e) {
      throw ServerFailure("Unexpected login error. Please try again.");
    }
  }

 Future<String> logout() async {
  try {
    final response = await _dio.post('/logout');

    if (response.statusCode == 200) {
      await AuthService.clearLoginData();
      return response.data["message"] ?? "Logged out successfully";
    } else {
      throw ServerFailure("Logout failed: ${response.statusCode}");
    }
  } on DioException catch (dioError) {
    throw ErrorMapper.mapError(dioError);
  } catch (e) {
    throw ServerFailure("Unexpected Logout error. Please try again.");
  }
}

}
