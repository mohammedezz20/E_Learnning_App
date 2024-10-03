import 'package:e_learning_app/core/utils/hive_constants.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:hive/hive.dart';

abstract class CoursesLocalDataSource {
  Future<List<CourseEntity>> fetchCoursesFromHive();
}
class CoursesLocalDataSourceImpl extends CoursesLocalDataSource{
  @override
  Future<List<CourseEntity>> fetchCoursesFromHive() async {
  var box= Hive.box<CourseEntity>(HiveConstants.coursesBox);
  print('getting cached data');
     return box.values.toList();
  }

}