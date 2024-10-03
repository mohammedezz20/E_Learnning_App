import 'package:dio/dio.dart';
import 'package:e_learning_app/core/hive_services.dart';
import 'package:e_learning_app/core/utils/hive_constants.dart';
import 'package:e_learning_app/features/Cources/data/models/all_courses_model.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';

abstract class CoursesRemoteDataSource{
  Future <List<CourseEntity>>fetchCourses();
}
class CoursesRemoteDataSourceImpl extends CoursesRemoteDataSource{
  List<CourseEntity>coursesList=[];
  @override
  Future<List<CourseEntity>> fetchCourses()async {
  //    await  DioHelper.get(
  //       url: EndPoint.allCourses,
  //       token:LoginSuccessState.loginEntity?.token,
  //     ).then((value) {
  //      fillCoursesList(value);
  // });
  //TODO fetch data from api
    HiveService.save<CourseEntity>(HiveConstants.coursesBox,coursesList, HiveConstants.coursesBox);
   return coursesList;
}
 void fillCoursesList(Response<dynamic> list) {
  coursesList=[];
     for (var element in list.data) {
     coursesList.add(CourseModel.fromJson(element));
    }
  }

}
