part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}
class AuthChangePassVisibilityState extends AuthState{}
class AuthRememberUserState extends AuthState{}


class AuthSignUpLoadingState extends AuthState{}
class AuthSignUpErrorState extends AuthState{
  final String errorMessage;
  AuthSignUpErrorState({required this.errorMessage});
}
class AuthSignUpSuccessState extends AuthState{
  final UserDataEntity userData;
  AuthSignUpSuccessState({required this.userData});
}


class AuthSignInLoadingState extends AuthState{}
class AuthSignInErrorState extends AuthState{
  final String errorMessage;
  AuthSignInErrorState({required this.errorMessage});
}
class AuthSignInSuccessState extends AuthState{
  final UserDataEntity userData;
  AuthSignInSuccessState({required this.userData});
}

class ForgetPasswordLoadingState extends AuthState{}
class ForgetPasswordErrorState extends AuthState{
  final String errorMessage;
  ForgetPasswordErrorState({required this.errorMessage});
}
class ForgetPasswordSuccessState extends AuthState{
  final String message;
  ForgetPasswordSuccessState({required this.message});
}

class FetchUserDataLoadingState extends AuthState{}
class FetchUserDataErrorState extends AuthState{
  final String errorMessage;
  FetchUserDataErrorState({required this.errorMessage});
}
class FetchUserDataSuccessState extends AuthState{
  final UserModel userModel;
  FetchUserDataSuccessState(this.userModel);
}

