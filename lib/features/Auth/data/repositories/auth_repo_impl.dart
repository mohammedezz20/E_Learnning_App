import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error_handling.dart';
import 'package:e_learning_app/features/Auth/data/datasources/auth_datasource.dart';
import 'package:e_learning_app/features/Auth/data/datasources/auth_local_datasource.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_up_model.dart';
import 'package:e_learning_app/features/Auth/data/models/user_model.dart';
import 'package:e_learning_app/features/Auth/domain/entities/user_entity.dart';
import 'package:e_learning_app/features/Auth/domain/repositories/auth_repo.dart';

class AuthRepository implements IAuthRepo{

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  
  AuthRepository({required this.remoteDataSource,required this.localDataSource});

  @override
  Future<Either<String,UserModel>>signIn({
    required String email,
    required String password,
  }){
    //TODO Post data to API & save token
        throw UnimplementedError();

  }
  
  @override
  void saveUserData(){
    //TODO save to cach helper
  }

  @override
   Future<Either<Failure, UserDataEntity>> signUp({
   required SignUpModel signUpModel,
  })
   async {
     try{
       final response = await remoteDataSource.signUp(signUpModel: signUpModel);
       return right(response);
     }catch(e){
       return left(ServerFailure(message:e.toString()));
     }
  }

 @override
 Future<Either<String, UserModel>> getUserProfile() async {
    //TODO implement get user profile
        throw UnimplementedError();
  }




}