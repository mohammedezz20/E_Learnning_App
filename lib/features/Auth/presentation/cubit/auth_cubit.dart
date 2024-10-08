import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_in_model.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_up_model.dart';
import 'package:e_learning_app/features/Auth/data/models/user_model.dart';
import 'package:e_learning_app/features/Auth/domain/entities/user_entity.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/sign_in_use_case.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/signup_use_case.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.signUpUseCase, this.signInUseCase) : super(AuthInitial());
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;


  bool isChecked = false;

  bool isPasswordVisible = true;

  void changePassVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(AuthChangePassVisibilityState());
  }

  String? passwordValidator(value) {
    if (value!.length < 8 ||
        !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])').hasMatch(value)) {
      return 'Password must be at least 8 characters with a mix of uppercase, lowercase, and numbers';
    }
    return null;
  }


  String? emailValidator(value) {
    if (value!.isEmpty) {
      return 'Please enter your Email';
    } else if (!RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void rememberUserCheck(value) {
    isChecked = value;
    emit(AuthRememberUserState());
  }

  Future<void> signIn({
  required SignInModel signInModel
   }
   ) async {
    emit(AuthSignInLoadingState());
    final response = await signInUseCase.call(signInModel);
    response.fold(
      (errMessage) => emit(AuthSignInErrorState(errorMessage: errMessage.toString())),
      (userData) => emit(AuthSignInSuccessState(userData:userData )),
    );
  }
  Future<void> signUp({
    required SignUpModel signUpModel,
   }) async {
    emit(AuthSignUpLoadingState());
    final response = await signUpUseCase.call(signUpModel);
    response.fold(
      (errMessage) => emit(AuthSignUpErrorState(errorMessage: errMessage.toString())),
      (userData) => emit(AuthSignUpSuccessState(userData:userData )),
    );
  }

  Future<void> getUserData({required String token})async{
    // emit(FetchUserDataLoadingState());
    //  final response = await userRepository.getUserProfile();
    //   response.fold(
    //   (errMessage) => emit(FetchUserDataErrorState(errorMessage: errMessage)),
    //   (signInModel) => emit(FetchUserDataSuccessState(signInModel)),
    // );

  }
}

