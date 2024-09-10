import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/presentation/pages/course_details.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/course_data_widget.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/save_course.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatefulWidget {
  final CourseEntity course;

  const CourseCard({super.key, required this.course});

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool? isSaved;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetails(
              course: widget.course,
              isSaved: isSaved??false, // Pass the isSaved property
              onSaveChanged: (value) {
                setState(() {
                  isSaved = value; // Update the isSaved property
                });
              },
            ),
          ),
        );
      },
      child: Card(
        color: AppColor.lightBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.course.imageUrl,
                      width: MediaQuery.of(context).size.height * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                 SaveCourse(isSaved:isSaved??false),
                        const SizedBox(height: 5.0),
                  CourseDataWidget(course: widget.course,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
  
    );
  }
}