  import 'package:e_learning_app/features/Auth/data/datasources/auth_datasource.dart';
import 'package:e_learning_app/features/Auth/data/datasources/auth_local_datasource.dart';
import 'package:e_learning_app/features/Auth/data/datasources/pass_management_data_source.dart';
import 'package:e_learning_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:e_learning_app/features/Auth/data/repositories/pass_repo_impl.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/forget_pass_use_case.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/reset_pass_use_case.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/sign_in_use_case.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/signup_use_case.dart';
import 'package:e_learning_app/features/Cources/data/data_sources/courses_local_datasource.dart';
import 'package:e_learning_app/features/Cources/data/data_sources/courses_remote_datasource.dart';
import 'package:e_learning_app/features/Cources/data/repositories/courses_repo_impl.dart';
import 'package:e_learning_app/features/Cources/domain/use_cases/all_courses_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;
void setupLocator(){
   getIt.registerSingleton<AuthRepository>(AuthRepository
    (remoteDataSource: RemoteDataSource(), localDataSource: LocalDataSource()),);

   getIt.registerSingleton<PasswordRepositoryImpl>(PasswordRepositoryImpl(
    passDataSource: PassManagementDataSourceImpl()),);

  getIt.registerSingleton<SignUpUseCase>(SignUpUseCase
    (authRepo: getIt.get<AuthRepository>()),);

  getIt.registerSingleton<SignInUseCase>(SignInUseCase
    (authRepo: getIt.get<AuthRepository>()),);

   getIt.registerSingleton<ForgetPassUseCase>(ForgetPassUseCase
    ( passRepo: getIt.get<PasswordRepositoryImpl>()),);

 getIt.registerSingleton<ResetPassUseCase>(ResetPassUseCase
    ( passRepo: getIt.get<PasswordRepositoryImpl>()),);

  getIt.registerSingleton<CourseUseCase>(CourseUseCase
    ( courseRepo: CoursesRepository(coursesRemoteDataSource: CoursesRemoteDataSourceImpl(), 
    coursesLocalDatasource: CoursesLocalDataSourceImpl())));

}
