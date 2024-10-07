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

class FetchUserDataLoadingState extends AuthState{}
class FetchUserDataErrorState extends AuthState{
  final String errorMessage;
  FetchUserDataErrorState({required this.errorMessage});
}
class FetchUserDataSuccessState extends AuthState{
  final UserModel userModel;
  FetchUserDataSuccessState(this.userModel);
}

