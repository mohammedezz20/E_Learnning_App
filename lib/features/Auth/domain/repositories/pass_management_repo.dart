import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/failure_handling.dart';

abstract class PasswordRepository {
  Future<Either<FailureHandler, String>> forgetPassword({required String email});
  Future<Either<FailureHandler, String>> resetPassword({required String email,required String otp,required String newPassword});
}