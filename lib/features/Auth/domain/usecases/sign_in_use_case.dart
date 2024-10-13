import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/failure_handling.dart';
import 'package:e_learning_app/core/use_cases.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_in_model.dart';
import 'package:e_learning_app/features/Auth/domain/entities/user_entity.dart';
import 'package:e_learning_app/features/Auth/domain/repositories/auth_repo.dart';

class SignInUseCase extends UseCase<UserDataEntity,SignInModel>{
   SignInUseCase({required this.authRepo});
   final IAuthRepo authRepo;

  @override
  Future<Either<FailureHandler, UserDataEntity>> call([SignInModel? param]) {
  return authRepo.signIn(signInModel: param!);
  }
}