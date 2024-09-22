import 'package:e_learning_app/features/Cources/presentation/pages/ins%20profile/widgets/about%20taps/ins_courses_tap.dart';
import 'package:e_learning_app/features/Cources/presentation/pages/ins%20profile/widgets/about%20taps/ins_reviews_taps.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/about%20course%20widgets/review_tab_widget.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutInsTabs extends StatelessWidget {
  const AboutInsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
         TabBar(
           labelColor: Colors
               .blue, // Set the color of the active tab label to blue
           labelStyle: TextStyle(
               fontSize: 16.sp,
               fontWeight: FontWeight
                   .bold), // Adjust the font size of the active tab label
           indicatorSize: TabBarIndicatorSize.tab,
           indicatorWeight: 4.h,

           indicatorColor:
           Colors.blue, // Set the color of the indicator to blue

           tabs:  [
             Tab(text: S.of(context).courses),
             Tab(text: S.of(context).student),
             Tab(text: S.of(context).reviews),
           ],
         ),
         const SizedBox(height: 10.0),
         const SizedBox(
           height: 250, // Use a fixed pixel value for predictable layout
           child: TabBarView(
             children: [
               INSCoursesBuilderTap(),
               InsCourses(),
               Reviews(),
             ],
           ),
         ),
             
    ],);
  }
}