import 'package:e_learning_app/core/utils/hive_constants.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:hive/hive.dart';

abstract class CoursesLocalDatasource {
  Future<List<CourseEntity>> fetchCoursesFromHive();
}
class CoursesLocalDatasourceImpl extends CoursesLocalDatasource{
  @override
  Future<List<CourseEntity>> fetchCoursesFromHive() async {
  var box= Hive.box<CourseEntity>(HiveConstants.coursesBox);
  print('getting cached data');
     return box.values.toList();
  }

}