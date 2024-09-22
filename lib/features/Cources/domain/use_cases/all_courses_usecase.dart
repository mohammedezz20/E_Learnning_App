import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error_handling.dart';
import 'package:e_learning_app/core/use_cases.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/domain/repositories/courses_repo.dart';

class CourseUseCase extends UseCase<List<CourseEntity>,NoParam>{
   CourseUseCase({required this.courseRepo});
   final CoursesRepo courseRepo;

  @override
  Future<Either<Failure, List<CourseEntity>>> call([NoParam? param]) {
  return courseRepo.getAllCourses();
  }
}