import 'package:e_learning_app/features/my-courses/presentation/widgets/completed_courses_list.dart';
import 'package:e_learning_app/features/my-courses/presentation/widgets/courses_tab_list.dart';
import 'package:e_learning_app/features/my-courses/presentation/widgets/ongoing_courses_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesScreenBody extends StatelessWidget {
  const MyCoursesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: const Column(
        children: [
          Expanded(
            child: MyCoursesTabList(
              onGoingContent: OngoingCoursesList(),
              completedContent: CompletedCoursesList(),
            ),
          ),
        ],
      ),
    );
  }
}
