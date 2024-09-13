import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/utils/extensions/build_context_extensions.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/presentation/cubit/cources_cubit.dart';
import 'package:e_learning_app/features/Cources/presentation/pages/courses_tabs_widget.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/about%20course%20widgets/course_datails_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CourseDetails extends StatefulWidget {
//   final CourseEntity course;
//   final bool isSaved;
//   final Function(bool) onSaveChanged;

//   const CourseDetails({
//     super.key,
//     required this.course,
//     required this.isSaved,
//     required this.onSaveChanged,
//   });

//   @override
//   _CourseDetailsState createState() => _CourseDetailsState();
// }

class CourseDetailsScreen extends StatelessWidget{
 final CourseEntity course;
  final bool isSaved;

  const CourseDetailsScreen({
    super.key,
    required this.course,
    required this.isSaved,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit,CourcesState>(
        listener: (context,state){},
        builder: (context,state){
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3, // Number of tabs
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: course.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        course.imageUrl,
                        width: double.infinity,
                        height: context.screenHeight /3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox( height:context.screenHeight * 0.03, ),
                 CourseDatailsWidget(course: course, isSaved: isSaved,),
                  const SizedBox(height: 7.0),
                 const AboutTabs(),
                  ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: SizedBox(
            height: 60.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.blueColor,
              ),
              child: Text(
                'Enroll - \$${course.price}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      
      ),
    );
 });
}}