import 'package:e_learning_app/core/utils/extensions/build_context_extensions.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/about%20course%20widgets/course_data.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CourseDatailsWidget extends StatelessWidget {
  const CourseDatailsWidget({super.key,
  required this.course,
  required this.isSaved,
  });
  final CourseEntity course;
  final bool isSaved;
  @override
  Widget build(BuildContext context) {
    return 
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CourseDate(course: course,
                  isSaved: isSaved,
                  ),
                 SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  Text(
                    '\$${ course.price}', // Display course price
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height:context.screenHeight * 0.02,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.people,
                          size: 20.0, color: Colors.blue),
                      Text(
                        ' ${ course.numRatings} ${S.of(context).student}', // Display number of enrolled students
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: context.screenWidth * 0.1),
                      const Icon(Icons.watch_later,
                          size: 20.0, color: Colors.blue),
                      Text(
                        ' 25 ${S.of(context).hours}', // Display number of hours
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
                

  }
}