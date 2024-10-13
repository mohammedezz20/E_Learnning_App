
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_learning_app/core/failure_handling.dart';
import 'package:e_learning_app/features/Auth/data/datasources/pass_management_data_source.dart';
import 'package:e_learning_app/features/Auth/data/models/reset_pass_model.dart';
import 'package:e_learning_app/features/Auth/domain/repositories/pass_management_repo.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  final PassManagementDataSource passDataSource;
  PasswordRepositoryImpl({required this.passDataSource});
  @override
  Future<Either<FailureHandler, String>> forgetPassword({required String email})async {
    try{
     final response =await passDataSource.forgetPassword(email: email);
     return right(response);
    }catch(error){
      if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    } 
    }
  }

  @override
  Future<Either<FailureHandler, String>> resetPassword({required RestPassModel restPassModel})async {
     try{
     final response =await passDataSource.resetPassword(restPassModel: restPassModel);
     return right(response);
    }catch(error){
      if(error is DioException){
      return left(ServerFailure.fromDiorError(error));
    }else{
      return left(ServerFailure(error.toString()));
    } 
    }
  }

}