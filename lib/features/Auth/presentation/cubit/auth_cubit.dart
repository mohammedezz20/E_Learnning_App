// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());

//   bool isChecked = false;
//   Map userData = {};
//   // GlobalKey<FormState> signInFormKey = GlobalKey();
//   TextEditingController signInEmailController = TextEditingController();
//   TextEditingController signInPasswordController = TextEditingController();
//   bool isPasswordVisible = true;
//   IconData passSuffix=Icons.visibility_off_outlined;

//   void changePassVisibility(){
//       isPasswordVisible = !isPasswordVisible;
//       passSuffix=isPasswordVisible?Icons.visibility_off_outlined:Icons.visibility_outlined;
//       emit(AuthChangePassVisibilityState());
//   }

//   String? passwordValidator(value){
//      if (value!.length < 8 ||
//             !RegExp(r'^(?=.?[a-z])(?=.?[A-Z])(?=.*?[0-9])')
//                 .hasMatch(value)) {
//           return 'Password must be at least 8 characters with a mix of uppercase, lowercase, and numbers';
//         }
//         return null;
//   }

//   String? emailValidator(value){
//       if (value!.isEmpty) {
//              return 'Please enter your Email';
//            } else if (!RegExp(
//                r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
//                .hasMatch(value)) {
//              return 'Please enter a valid email address';
//            }
//            return null;
//   }

//   void rememberUserCheck(value){
//        isChecked = !value;
//        emit(AuthRememberUserState());
//   }

// }

import 'package:bloc/bloc.dart';
import 'package:e_learning_app/features/Auth/domain/repositories/auth_repository.dart';

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


   signIn(
   ) async {
    // emit(AuthLoginLoadingState());
    // final response = await userRepository.signIn(
    //   email: signInEmailController.text,
    //   password: signInPasswordController.text,
    // );
    // response.fold(
    //   (errMessage) => emit(AuthLoginErrorState(errorMessage: errMessage)),
    //   (signInModel) => emit(AuthLoginSuccessState()),
    // );

    //TODO manage sign in states
  }

   signUp() async {
    // emit(AuthLoginLoadingState());
    // final response = await userRepository.signIn(
    //   email: signInEmailController.text,
    //   password: signInPasswordController.text,
    // );
    // response.fold(
    //   (errMessage) => emit(AuthLoginErrorState(errorMessage: errMessage)),
    //   (signInModel) => emit(AuthLoginSuccessState()),
    // );

    //TODO manage sign up states
  }


}

