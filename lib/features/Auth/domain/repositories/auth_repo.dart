
import 'package:dartz/dartz.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_up_model.dart';
import 'package:e_learning_app/features/Auth/data/models/user_model.dart';

abstract class IAuthRepo {

  Future<Either<String,UserModel>>signIn({
    required String email,
    required String password,
  });
  
  void saveUserData();

  Future<Either<String, SignUpModel>> signUp({
    required String email,
    required String password,
  });
 
  Future<Either<String, UserModel>> getUserProfile();


}