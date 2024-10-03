import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/features/Cources/domain/entities/all_courses_entity.dart';
import 'package:e_learning_app/features/Cources/presentation/cubit/cources_cubit.dart';
import 'package:e_learning_app/features/Cources/presentation/pages/course_details_screen.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/course_data_widget.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/save_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCard extends StatelessWidget {
  final CourseEntity course;
  final BuildContext context1;
  final bool isSaved ;
  const CourseCard({super.key,required this.context1, required this.course,required this.isSaved});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context1,
          MaterialPageRoute(
            builder: (context){ 
              return   BlocProvider.value(
             value: context1.read<CoursesCubit>(),
             child: CourseDetailsScreen(
              isSaved: course.isSaved,
              course: course, 
              //     onSaveChanged: (value) {
              //     isSaved = value; 
              //  },
            ),);}
          ),
        );
      },
      child: Card(
        color: AppColor.lightBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      course.imageUrl,
                      width: MediaQuery.of(context).size.height * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                 SaveCourse(isSaved: isSaved),
                        const SizedBox(height: 5.0),
                  CourseDataWidget(course: course,),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
  
    );
  }
}