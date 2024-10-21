import 'package:e_learning_app/features/my-courses/presentation/pages/lessons/widgets/certificate_tab.dart';
import 'package:e_learning_app/features/my-courses/presentation/pages/lessons/widgets/course_lessons_tab_view.dart';
import 'package:e_learning_app/features/my-courses/presentation/pages/lessons/widgets/lessons_tab_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseLessonsBodyScreen extends StatelessWidget {
  const CourseLessonsBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: const Column(
        children: [
          Expanded(
            child: CourseLessonsTabView(
              lessonsTab: LessonsTabList(),
              certificatesTab: CertificateTab(),
            ),
          ),
        ],
      ),
    );
  }
}
