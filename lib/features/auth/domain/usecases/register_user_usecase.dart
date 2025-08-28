import 'package:medb/core/errors/failures.dart';
import 'package:medb/features/auth/data/repositories/register_repository_impl.dart';

class RegisterUser {
  final RegisterRepository repository;
  RegisterUser(this.repository);

  Future<Failures?> call({
    required String firstName,
    String? middleName,
    String? lastName,
    required String email,
    required String phone,
    required String password,
  }) {
    return repository.registerUser(
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      email: email,
      phone: phone,
      password: password,
    );
  }
}