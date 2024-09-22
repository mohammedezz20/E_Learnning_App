import 'package:e_learning_app/features/Cources/data/all_courses_local_data.dart';
import 'package:e_learning_app/features/Cources/presentation/cubit/cources_cubit.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/all_courses_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesBuilder extends StatelessWidget {
 const CoursesBuilder({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit,CoursesState>(builder: (context,state){
        return  AllCoursesListView(context1: context,
        course:AllCoursesLocalData.courses,//replace it with list of courses from API      
        );
     });
  }
}