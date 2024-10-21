import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/failure_handling.dart';
import 'package:e_learning_app/core/use_cases.dart';
import 'package:e_learning_app/features/Cources/domain/entities/course_details_entity.dart';
import 'package:e_learning_app/features/Cources/domain/repositories/courses_repo.dart';

class CourseDetailsUseCase extends UseCase<CourseDetailsEntity,String>{
   CourseDetailsUseCase({required this.courseRepo});
   final CoursesRepo courseRepo;

  @override
  Future<Either<FailureHandler, CourseDetailsEntity>> call([String? param]) {
  return courseRepo.getCourseDetails(courseId: param!);
  }
}