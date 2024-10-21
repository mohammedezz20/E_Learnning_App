import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:e_learning_app/features/my-courses/presentation/pages/lessons/widgets/lesson_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/themes/colors.dart';
import '../../../../../../core/utils/widgets/custom_button.dart';

class LessonsTabList extends StatelessWidget {
  const LessonsTabList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              text: 'Start Course Again'),
        ),
      ],
    );
  }
}
