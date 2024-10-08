import 'package:e_learning_app/core/dio_helper.dart';
import 'package:e_learning_app/core/utils/api_constants.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_in_model.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_up_model.dart';
import 'package:e_learning_app/features/Auth/domain/entities/user_entity.dart';

abstract class IAuthDataSource{
  Future<UserDataEntity>signIn({required SignInModel signInModel});
  Future<UserDataEntity>signUp({required SignUpModel signUpModel});
}
class RemoteDataSource implements IAuthDataSource{
  @override
 Future<UserDataEntity> signIn({required SignInModel signInModel}) async{
         final response = await DioHelper.post(
        url: APIConstants.signIn,
        data: signInModel.toJson(),
      );
      if (response.statusCode == 200) {
        final data = response.data['data'];
        print('sign in success ${data.toString()}');
        return UserDataEntity.fromJson(data);
      } else {
        throw Exception('Failed to sign in: ${response.statusCode}');
      }
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