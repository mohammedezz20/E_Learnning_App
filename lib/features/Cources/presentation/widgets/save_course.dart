import 'package:e_learning_app/config/themes/colors.dart';
import 'package:flutter/material.dart';

class SaveCourse extends StatelessWidget {
  const SaveCourse({required this.isSaved, super.key});
    final bool isSaved;
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
             icon:isSaved
                 ? const Icon(Icons.bookmark)
                 : const Icon(Icons.bookmark_outline),
             color: Colors
                 .blue, // Change color to blue if isSaved is true
             onPressed: () { 
             },
           ),
       
         ],
       );
                     
  }
}