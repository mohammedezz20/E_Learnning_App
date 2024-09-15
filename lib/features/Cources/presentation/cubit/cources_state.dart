part of 'cources_cubit.dart';

abstract class CourcesState  {
  const CourcesState();

  @override
  List<Object> get props => [];
}

class CourcesInitial extends CourcesState {}

class ChangeIsSavedState extends CourcesState {
  final bool isSaved;
  ChangeIsSavedState({required this.isSaved});
}

class GetAllCoursesLoadingState extends CourcesState {}
class GetAllCoursesSuccessState extends CourcesState {
 final List<CourseEntity> courses;
  GetAllCoursesSuccessState({required this.courses});
}
class GetAllCoursesErrorState extends CourcesState {
  final String error;
  GetAllCoursesErrorState({required this.error});
}
