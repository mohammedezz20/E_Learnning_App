import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/failure_handling.dart';
import 'package:e_learning_app/core/use_cases.dart';
import 'package:e_learning_app/features/Auth/data/models/reset_pass_model.dart';

import 'package:e_learning_app/features/Auth/domain/repositories/pass_management_repo.dart';

class ResetPassUseCase extends UseCase<String,RestPassModel>{
   ResetPassUseCase({required this.passRepo});
   final PasswordRepository passRepo;

  @override
  Future<Either<FailureHandler, String>> call([RestPassModel? param]) {
  return passRepo.resetPassword(restPassModel: param!);
  }
}