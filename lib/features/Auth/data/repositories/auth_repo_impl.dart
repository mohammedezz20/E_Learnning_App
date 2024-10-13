import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/core/failure_handling.dart';
import 'package:e_learning_app/features/Auth/data/datasources/auth_datasource.dart';
import 'package:e_learning_app/features/Auth/data/datasources/auth_local_datasource.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_in_model.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_up_model.dart';
import 'package:e_learning_app/features/Auth/data/models/user_model.dart';
import 'package:e_learning_app/features/Auth/domain/entities/user_entity.dart';
import 'package:e_learning_app/features/Auth/domain/repositories/auth_repo.dart';

class AuthRepository implements IAuthRepo{

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  
  AuthRepository({required this.remoteDataSource,required this.localDataSource});

  @override
 Future<Either<FailureHandler, UserDataEntity>> signIn({
    required SignInModel signInModel
  })async{
    try{
       final response = await remoteDataSource.signIn(signInModel: signInModel);
       return right(response);
     }catch(error){
     if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }     }
  }
  
  @override
   Future<Either<FailureHandler, UserDataEntity>> signUp({
   required SignUpModel signUpModel,
  })
   async {
     try{
       final response = await remoteDataSource.signUp(signUpModel: signUpModel);
       return right(response);
     }catch(error){
    if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    }      }
  }

 @override
 Future<Either<String, UserModel>> getUserProfile() async {
    //TODO implement get user profile
        throw UnimplementedError();
  }

  @override
  void saveUserData(){
    //TODO save to cach helper
  }



}