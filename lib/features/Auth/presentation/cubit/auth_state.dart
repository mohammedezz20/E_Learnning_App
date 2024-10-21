part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}
class AuthChangePassVisibilityState extends AuthState{}
class AuthRememberUserState extends AuthState{}


class AuthLoginLoadingState extends AuthState{}
class AuthLoginErrorState extends AuthState{
  final String errorMessage;
  AuthLoginErrorState({required this.errorMessage});
}
class AuthLoginSuccessState extends AuthState{}

class FetchUserDataLoadingState extends AuthState{}
class FetchUserDataErrorState extends AuthState{
  final String errorMessage;
  FetchUserDataErrorState({required this.errorMessage});
}
class FetchUserDataSuccessState extends AuthState{
  final UserModel userModel;
  FetchUserDataSuccessState(this.userModel);
}

