import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/failure_handling.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_in_model.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_up_model.dart';
import 'package:e_learning_app/features/Auth/data/models/user_model.dart';
import 'package:e_learning_app/features/Auth/domain/entities/user_entity.dart';

abstract class IAuthRepo {

  Future<Either<FailureHandler, UserDataEntity>> signIn({
    required SignInModel signInModel
  });
  
  void saveUserData();

  Future<Either<FailureHandler, UserDataEntity>> signUp({
   required SignUpModel signUpModel,
  });
 
  Future<Either<String, UserModel>> getUserProfile();


}