// ignore: depend_on_referenced_packages
import 'package:samsidh_task/core/Excepations/Authentication/authentication_faild_excepation.dart';
import 'package:samsidh_task/core/Excepations/Authentication/invalid_exception.dart';
import 'package:samsidh_task/features/authentication/domain/repository/auth_repository.dart';

final class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase({required this.repository});

  Future<void> call(String email, String password) async {
    /// Verify email and password
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialsException();
    }

    try {
      await repository.signIn(email, password);
    } on Exception {
      throw AuthenticationFailedException('Cannot Login. Please try again.');
    }
  }
}
