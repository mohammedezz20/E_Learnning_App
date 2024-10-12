import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/failure_handling.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/domain/entities/course_details_entity.dart';


abstract class CoursesRepo{
 Future<Either<FailureHandler, List<CourseEntity>>>getAllCourses();
 Future<Either<FailureHandler, CourseDetailsEntity>>getCourseDetails({required String courseId});
}