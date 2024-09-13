import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/features/Cources/data/models/message%20model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserMessageWidget extends StatelessWidget {
  const UserMessageWidget({
    required this.message,
    super.key});
  final MessagesModel message;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h, bottom: 5.h),
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: AppColor.blueColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 70, left: 8),
              child: Text(
                message.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            width: 80,
            child: Text(
              '2.50 pm',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
        )
      ],
    );


  }
}