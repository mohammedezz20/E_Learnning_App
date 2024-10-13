import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/failure_handling.dart';
import 'package:e_learning_app/core/use_cases.dart';

import 'package:e_learning_app/features/Auth/domain/repositories/pass_management_repo.dart';

class ForgetPassUseCase extends UseCase<String,String>{
   ForgetPassUseCase({required this.passRepo});
   final PasswordRepository passRepo;

  @override
  Future<Either<FailureHandler, String>> call([String? param]) {
  return passRepo.forgetPassword(email: param!);
  }
}