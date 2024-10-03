import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/Get%20it/setup_locator.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/features/Cources/data/all_courses_local_data.dart';
import 'package:e_learning_app/features/Cources/domain/use_cases/all_courses_usecase.dart';
import 'package:e_learning_app/features/Cources/presentation/cubit/cources_cubit.dart';
import 'package:e_learning_app/features/Cources/presentation/widgets/all_courses_builder.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCoursesScreen extends StatelessWidget {
 const AllCoursesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CoursesCubit(coursesUseCase:getIt.get<CourseUseCase>() ),
      child: BlocConsumer<CoursesCubit,CoursesState>(
        listener: (context,state){},
        builder: (context,state){
          return  SafeArea(
          child: Scaffold(
            appBar: AppBar(
                backgroundColor: CachHelper.getData(key: 'isDark')
             ?  const Color(0xff1f222a)
             :   Colors.grey[200],
            
              title: Text(S.of(context).all_courses,style: TextStyle(
                color:  CachHelper.getData(key: 'isDark')
             ?  Colors.grey[200]
            : const Color(0xff1f222a) 
              ),),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    "${AllCoursesLocalData.courses.length} ${S.of(context).courses_found}",
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
