import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../core/utils/widgets/custom_button.dart';
import 'lesson_card_widget.dart';

class OngoingCourseLessonsScreen extends StatelessWidget {
  const OngoingCourseLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Design Illustration'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => const LessonCardWidget(),
                separatorBuilder: (context, index) => 15.sizedBoxHeight,
                itemCount: 10),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.h),
            child: const CustomButton(
                backgroundColor: AppColor.buttonColor,
                width: double.infinity,
                text: 'Continue Course'),
          ),
        ],
      ),
    );
  }
}
