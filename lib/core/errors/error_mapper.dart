
import 'package:dio/dio.dart';
import 'failures.dart';

class ErrorMapper {
  static Failures mapError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return NetworkFailure("Connection timed out. Please try again.");

        case DioExceptionType.sendTimeout:
          return NetworkFailure("Request timed out while sending. Try again.");

        case DioExceptionType.receiveTimeout:
          return NetworkFailure("Server took too long to respond. Try later.");

        case DioExceptionType.badCertificate:
          return ServerFailure("Invalid SSL certificate. Secure connection failed.");

        case DioExceptionType.cancel:
          return NetworkFailure("Request was cancelled. Please retry.");

        case DioExceptionType.connectionError:
          return NetworkFailure("No internet connection. Please check your network.");

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode ?? 500;
          switch (statusCode) {
            case 400:
              return ValidationFailure("Bad Request: Invalid input data.");
            case 401:
              return ServerFailure("Unauthorized: Please login again.");
            case 403:
              return ServerFailure("Forbidden: You don’t have access.");
            case 404:
              return ServerFailure("API not found.");
            case 422:
              return ValidationFailure("Unprocessable Entity: Invalid request data.");
            case 429:
              return ServerFailure("Too many requests. Please slow down.");
            case 500:
              return ServerFailure("Internal server error. Please try again later.");
            case 503:
              return ServerFailure("Service unavailable. Try again later.");
            default:
              return ServerFailure(
                  "Unexpected server error: ${error.response?.statusMessage ?? 'Unknown'}");
          }

        case DioExceptionType.unknown:
        return NetworkFailure("Unexpected network issue. Please check your connection.");
      }
    }

    return ServerFailure("Unexpected error occurred. Please try again.");
  }
}
