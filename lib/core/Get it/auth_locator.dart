  import 'package:e_learning_app/features/Auth/data/datasources/auth_datasource.dart';
import 'package:e_learning_app/features/Auth/data/datasources/auth_local_datasource.dart';
import 'package:e_learning_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;
void setupLocator(){
  getIt.registerSingleton<AuthRepository>(AuthRepository
    (remoteDataSource: RemoteDataSource(),localDataSource: LocalDataSource()));
}
