import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassImage extends StatelessWidget {
  const ResetPassImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Container(
               alignment: AlignmentDirectional.center,
               child: CircleAvatar(
                 radius:180.r,
                 backgroundColor: Colors.black.withOpacity(.0),
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Image.asset(
                     image,
                   ),
                 ),
               ),
             ),
             const SizedBox(
               height: 25,
             ),
             
    ],);
  }
}