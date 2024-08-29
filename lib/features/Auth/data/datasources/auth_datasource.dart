abstract class IAuthDatasource{
  Future<void>signIn({required email,required password});
  Future<void>register({required email,required password});
}
class RemoteDataSource implements IAuthDatasource{
  @override
  Future<void> signIn({required email, required password}) async{
    //TODO implement sign in From API
    //TODO save user data to local
    throw UnimplementedError();
  }
  @override
  Future<void> register({required email, required password})async {
    // TODO: implement signUp From API
    // TODO save user data to local
    throw UnimplementedError();
  }
}