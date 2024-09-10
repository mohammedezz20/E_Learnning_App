import 'package:e_learning_app/config/themes/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SaveCourse extends StatefulWidget {
   SaveCourse({required this.isSaved ,super.key});
   bool isSaved;

  @override
  State<SaveCourse> createState() => _SaveCourseState();
}
class _SaveCourseState extends State<SaveCourse> {
  
  @override
  Widget build(BuildContext context) {
    return Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Container(
             padding: const EdgeInsets.all(5.0),
             decoration: BoxDecoration(
               color:AppColor.lightBlueColor,
               borderRadius: BorderRadius.circular(5.0),
             ),
             child: Text(
               'Programming', // Replace 'Your Category' with the actual category
               style: Theme.of(context).textTheme.bodySmall?.copyWith(
                 color: AppColor.buttonColor,
               )
             ),
           ),
           IconButton(
             icon: widget.isSaved
                 ? const Icon(Icons.bookmark)
                 : const Icon(Icons.bookmark_outline),
             color: Colors
                 .blue, // Change color to blue if isSaved is true
             onPressed: () {
               setState(() {
                  widget.isSaved =
                     ! widget.isSaved; // Toggle isSaved when the icon is pressed
               });
             },
           ),
       
         ],
       );
                     
  }
}