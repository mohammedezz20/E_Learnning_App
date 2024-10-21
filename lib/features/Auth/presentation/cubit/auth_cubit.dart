import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/Auth/data/models/user_model.dart';
import 'package:e_learning_app/features/Auth/data/repositories/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.userRepository) : super(AuthInitial());
  final AuthRepository userRepository;

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
      required String email,
      required String pass,
   }
   ) async {
    emit(AuthLoginLoadingState());
    final response = await userRepository.signIn(
      email:  email,  
      password: pass
    );
    response.fold(
      (errMessage) => emit(AuthLoginErrorState(errorMessage: errMessage)),
      (signInModel) => emit(AuthLoginSuccessState()),
    );

    //TODO manage sign in states
  }

  Future<void> signUp({
    required String email,
    required String pass,
   }) async {
    emit(AuthLoginLoadingState());
    final response = await userRepository.signUp(
      email: email,
      password:pass,
    );
    response.fold(
      (errMessage) => emit(AuthLoginErrorState(errorMessage: errMessage)),
      (signInModel) => emit(AuthLoginSuccessState()),
    );

    //TODO manage sign up states
  }

  Future<void> getUserData({required String token})async{
    emit(FetchUserDataLoadingState());
     final response = await userRepository.getUserProfile();
      response.fold(
      (errMessage) => emit(FetchUserDataErrorState(errorMessage: errMessage)),
      (signInModel) => emit(FetchUserDataSuccessState(signInModel)),
    );

  }
}

