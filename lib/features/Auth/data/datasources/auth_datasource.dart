import 'package:e_learning_app/core/dio_helper.dart';
import 'package:e_learning_app/core/utils/api_constants.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_up_model.dart';
import 'package:e_learning_app/features/Auth/domain/entities/user_entity.dart';

abstract class IAuthDataSource{
  Future<void>signIn({required email,required password});
  Future<UserDataEntity>signUp({required SignUpModel signUpModel});
}
class RemoteDataSource implements IAuthDataSource{
  @override
  Future<void> signIn({required email, required password}) async{
    //TODO implement sign in From API
    //TODO save user data to local
    throw UnimplementedError();
  }

 @override
  Future<UserDataEntity> signUp({required SignUpModel signUpModel}) async {
      final response = await DioHelper.post(
        url: APIConstants.signUp,
        data: signUpModel.toJson(),
      );
      if (response.statusCode == 200) {
        final data = response.data['data'];
        return UserDataEntity.fromJson(data);
      } else {
        throw Exception('Failed to sign up: ${response.statusCode}');
      }
  }



}