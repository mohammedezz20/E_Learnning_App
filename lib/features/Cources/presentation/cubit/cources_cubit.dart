import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/domain/use_cases/all_courses_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cources_state.dart';

class CoursesCubit extends Cubit<CourcesState> {
  CoursesCubit({required this.coursesUseCase}) : super(CourcesInitial());
  static CoursesCubit get(context)=>BlocProvider.of(context);
    final CourseUsecase coursesUseCase; 

  
  // late bool isSaved;
  // changeSaveTap(bool value){
  //  isSaved=value;
  //  emit( ChangeIsSavedState(isSaved: isSaved));
  // }

  Future<void>fetchAllCourses()async{
    emit(GetAllCoursesLoadingState());
    final resault=await coursesUseCase.call();
    resault.fold(
       (error)=>emit(GetAllCoursesErrorState(error:error.toString() )),
       (courses)=>emit(GetAllCoursesSuccessState(courses: courses)),
       );
  }
}
