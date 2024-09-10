import 'package:e_learning_app/features/Cources/presentation/pages/all_courses.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';

class AllCoursesListView extends StatelessWidget {
  const AllCoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
              // shrinkWrap true, prevents the list from taking all the available space
              shrinkWrap: true,
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return CourseCard(course: courses[index]);
              },
            );
  }
}