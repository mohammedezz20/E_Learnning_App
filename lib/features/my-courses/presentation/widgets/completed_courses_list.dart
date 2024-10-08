import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:e_learning_app/features/my-courses/presentation/pages/lessons/course_lessons_screen.dart';
import 'package:e_learning_app/features/my-courses/presentation/widgets/completed_course_card.dart';
import 'package:flutter/material.dart';

class CompletedCoursesList extends StatelessWidget {
  const CompletedCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CourseLessonsScreen()));
          },
          child: const CompletedCourseCard()),
      separatorBuilder: (context, index) => 10.sizedBoxHeight,
      itemCount: 5,
    );
  }
}
