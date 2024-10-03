import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error_handling.dart';
import 'package:e_learning_app/features/Cources/data/data_sources/courses_local_datasource.dart';
import 'package:e_learning_app/features/Cources/data/data_sources/courses_remote_datasource.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/domain/entities/course_details_entity.dart';
import 'package:e_learning_app/features/Cources/domain/repositories/courses_repo.dart';

class CoursesRepository extends CoursesRepo{
  final CoursesRemoteDataSource coursesRemoteDataSource;
  final CoursesLocalDataSource coursesLocalDatasource;
  CoursesRepository({required this.coursesRemoteDataSource,required this.coursesLocalDatasource});
  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async{
  try{
    //  List<CoursesModel>cachedCourses = await coursesLocalDatasource
    //      .fetchCoursesFromHive();
    //  if(cachedCourses.isNotEmpty){
    //    return right(cachedCourses);
    //  }

    //TODO get all courses from data source.
   List<CourseEntity>courses=await coursesRemoteDataSource.fetchCourses();
    return right(courses);
  }catch(error){
    // if(error is DioException){
    //   return left(ServerFailure.fromDiorError(error));
    // }else{
      return left(ServerFailure(message:error.toString()));
  //   }
   }
  }

  @override
  Future<Either<Failure, CourseDetailsEntity>> getCourseDetails({required String courseId}) {
    // TODO: implement getCourseDetails
    throw UnimplementedError();
  }

  

}