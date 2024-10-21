import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:e_learning_app/features/my-courses/presentation/widgets/ongoing_course_card.dart';
import 'package:flutter/material.dart';

import '../pages/lessons/widgets/onGoing_course_lessons_screen.dart';

class OngoingCoursesList extends StatelessWidget {
  const OngoingCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OngoingCourseLessonsScreen(),
              ),
            );
          },
          child: const OngoingCourseCard()),
      separatorBuilder: (context, index) => 10.sizedBoxHeight,
      itemCount: 10,
    );
  }
}
