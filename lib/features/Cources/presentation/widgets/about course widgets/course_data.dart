import 'package:e_learning_app/core/utils/extensions/build_context_extensions.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDate extends StatelessWidget {
  const CourseDate({super.key,
  required this.course,
  required this.isSaved});

  final CourseEntity course;
  final bool isSaved;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
           Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SizedBox(
                   width: context.screenWidth * .8,
                   child: Text(
                     course.name,
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                     style: Theme.of(context)
                         .textTheme
                         .labelLarge
                         ?.copyWith(fontWeight: FontWeight.bold),
                   ),
                 ),
                 IconButton(
                   icon: isSaved
                       ? const Icon(Icons.bookmark)
                       : const Icon(Icons.bookmark_outline),
                   color: Colors.blue,
                   onPressed: () {
                   },
                 ),
               ],
             ),
         
        Row(
           children: [
           Container(
             padding: EdgeInsets.all(5.h),
             decoration: BoxDecoration(
               color: const Color(0xffEFF3FF),
               borderRadius: BorderRadius.circular(5.0),
                   ),
                   child: Text(
                     'Programming', // Replace 'Your Category' with the actual category
                     style: Theme.of(context)
                         .textTheme
                         .labelSmall
                         ?.copyWith(
                         fontWeight: FontWeight.w500,
                         color: Colors.blue[600]),
                   ),
                 ),
                 SizedBox(width: context.screenWidth * 0.1),
                 const Icon(Icons.star,
                     size: 16.0, color: Color(0xffFD9D17)),
                 Text(
                   ' (${course.rating})', // Display course rating
                   style: Theme.of(context)
                       .textTheme
                       .labelSmall
                       ?.copyWith(
                       fontWeight: FontWeight.bold,
                       color: const Color(0xffFD9D17)),
                 ),
               ],
             ),
      ],
    );
  }
}