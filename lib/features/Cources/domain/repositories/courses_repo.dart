import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error_handling.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/domain/entities/course_details_entity.dart';


abstract class CoursesRepo{
 Future<Either<Failure, List<CourseEntity>>>getAllCourses();
 Future<Either<Failure, CourseDetailsEntity>>getCourseDetails({required String courseId});
}