import 'package:e_learning_app/core/dio_helper.dart';
import 'package:e_learning_app/core/utils/api_constants.dart';

abstract class PassManagementDataSource {
  Future<String> forgetPassword({required String email});
  Future<void> resetPassword({required String email,required String otp,required String newPassword});
}
class PassManagementDataSourceImpl implements PassManagementDataSource {
  @override
  Future<String> forgetPassword({required String email}) async {
    print('email $email');
   final response= await DioHelper.post(
     url: APIConstants.forgetPass,
     data: {
       "email":email,
       "teacherId":APIConstants.testTeacherId
     }
   );
     if(response.statusCode == 200){
     return response.data['data']['message'];
     }else{
    print( response.data);
     return response.data['stack'];
     }
  }
  
  @override
  Future<void> resetPassword({required String email, required String otp, required String newPassword}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
