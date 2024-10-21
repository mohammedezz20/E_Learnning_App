import 'package:e_learning_app/features/my-courses/presentation/pages/lessons/course_lessons_body_screen.dart';
import 'package:flutter/material.dart';

class CourseLessonsScreen extends StatelessWidget {
  const CourseLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Design Illustration'),
      ),
      body: const CourseLessonsBodyScreen(),
    );
  }
}
