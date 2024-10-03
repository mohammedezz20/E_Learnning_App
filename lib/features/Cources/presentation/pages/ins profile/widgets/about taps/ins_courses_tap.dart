import 'package:e_learning_app/features/Cources/data/all_courses_local_data.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/all_courses_list_view.dart';
import 'package:flutter/material.dart';

class INSCoursesBuilderTap extends StatelessWidget {
 const INSCoursesBuilderTap({super.key});
  
  @override
  Widget build(BuildContext context) {
        return  AllCoursesListView(context1: context,
        course:AllCoursesLocalData.courses,//replace it with list of courses from API      
        );
  }
}