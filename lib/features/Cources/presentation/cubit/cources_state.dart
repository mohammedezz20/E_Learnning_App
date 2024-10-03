part of 'cources_cubit.dart';

abstract class CoursesState  {
  const CoursesState();

  @override
  List<Object> get props => [];
}

class CoursesInitial extends CoursesState {}

class ChangeIsSavedState extends CoursesState {
  final bool isSaved;
  ChangeIsSavedState({required this.isSaved});
}

class GetAllCoursesLoadingState extends CoursesState {}
class GetAllCoursesSuccessState extends CoursesState {
 final List<CourseEntity> courses;
  GetAllCoursesSuccessState({required this.courses});
}
class GetAllCoursesErrorState extends CoursesState {
  final String error;
  GetAllCoursesErrorState({required this.error});
}
