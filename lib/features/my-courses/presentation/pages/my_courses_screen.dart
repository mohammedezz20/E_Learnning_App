import 'package:e_learning_app/features/my-courses/presentation/pages/my_courses_screen_body.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).my_courses),
      ),
      body: const MyCoursesScreenBody(),
    );
  }
}
