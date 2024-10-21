import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/failure_handling.dart';
import 'package:e_learning_app/features/Auth/data/models/reset_pass_model.dart';

abstract class PasswordRepository {
  Future<Either<FailureHandler, String>> forgetPassword({required String email});
  Future<Either<FailureHandler, String>> resetPassword({required RestPassModel restPassModel});
}