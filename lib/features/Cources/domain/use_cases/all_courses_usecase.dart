import 'package:dartz/dartz.dart';
import 'package:e_learning_app/core/error_handling.dart';
import 'package:e_learning_app/core/use_cases.dart';
import 'package:e_learning_app/features/Cources/data/repositories/courses_repo_impl.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';

class CourseUsecase extends UseCase<List<CourseEntity>,NoParam>{
   CourseUsecase({required this.courseRepo});
   final CoursesRepository courseRepo;

  @override
  Future<Either<Failure, List<CourseEntity>>> call([NoParam? param]) {
  return courseRepo.getAllCourses();
  }
}