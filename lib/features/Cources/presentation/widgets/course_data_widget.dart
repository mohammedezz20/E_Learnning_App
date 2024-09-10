import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:flutter/material.dart';

class CourseDataWidget extends StatelessWidget {
  const CourseDataWidget({
    required this.course,
    super.key});
   final CourseEntity course;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                 Text(
           '${course.name} - \$${course.price}', // Display course name and price
           style: Theme.of(context).textTheme.labelSmall
         ),
         const SizedBox(height: 5.0),
         Row(
           children: [
             const Icon(Icons.star,
                 size: 16.0, color:  AppColor.joinmeetingColor),
             Text(
               '(${course.rating})', // Display course rating
               style:Theme.of(context).textTheme.labelSmall?.copyWith(
                 color:AppColor.joinmeetingColor,
               ),
             ),
             const SizedBox(width: 5.0),
             const Text(
               '|', // Separator
               style:
                   TextStyle(fontSize: 14.0, color: Colors.grey),
             ),
             const SizedBox(width: 5.0),
             const Icon(Icons.people,
                 size: 16.0, color: AppColor.buttonColor),
             Text(
               ' ${course.numRatings} students', // Display number of enrolled students
               style: Theme.of(context).textTheme.labelSmall?.copyWith(
                 color:AppColor.buttonColor,
               ),
             ),
           ],
         ),
      ],
    );
  }
}