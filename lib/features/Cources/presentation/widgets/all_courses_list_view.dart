import 'package:e_learning_app/features/Cources/data/all_courses_local_data.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';

class AllCoursesListView extends StatelessWidget {
   const AllCoursesListView({super.key,required this.context1,required this.course,});
  final BuildContext context1;
  final List<CourseEntity> course;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
              // shrinkWrap true, prevents the list from taking all the available space
              shrinkWrap: true,
              itemCount: AllCoursesLocalData.courses.length,
              itemBuilder: (context, index) {
                return CourseCard(course:course[index],context1: context1,isSaved:course[index].isSaved,);
              },
            );
  }
}