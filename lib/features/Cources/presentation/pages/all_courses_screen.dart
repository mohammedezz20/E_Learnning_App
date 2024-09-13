import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/features/Cources/data/all_courses_local_data.dart';
import 'package:e_learning_app/features/Cources/presentation/cubit/cources_cubit.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/all_courses_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCoursesScreen extends StatelessWidget {
 const AllCoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CoursesCubit(),
      child: BlocConsumer<CoursesCubit,CourcesState>(
        listener: (context,state){},
        builder: (context,state){
          return  SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[200],
              title: const Text('All Courses'),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    "${AllCoursesLocalData.courses.length} courses found",
                    style:   Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColor.newmeetingColor
                    )
                  ),
                ),
              ],
            ),
            body: Container(
              color: Colors.grey[200],
              child:  const Padding(
                padding: EdgeInsets.all(8.0),
                child:CoursesBuilder()
              ),
            ),
          ),
        );
        },
    
      ),
    );
  }
}
