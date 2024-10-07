import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error_handling.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_up_model.dart';
import 'package:e_learning_app/features/Auth/data/models/user_model.dart';
import 'package:e_learning_app/features/Auth/domain/entities/user_entity.dart';

abstract class IAuthRepo {

  Future<Either<String,UserModel>>signIn({
    required String email,
    required String password,
  });
  
  void saveUserData();

  Future<Either<Failure, UserDataEntity>> signUp({
   required SignUpModel signUpModel,
  });
 
  Future<Either<String, UserModel>> getUserProfile();


}