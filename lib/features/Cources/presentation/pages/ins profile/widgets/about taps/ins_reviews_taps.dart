import 'package:e_learning_app/features/Cources/presentation/widgets/user_view_widget.dart';
import 'package:flutter/material.dart';

class InsCourses extends StatelessWidget {
  const InsCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
     separatorBuilder:(context,index)=> const SizedBox(height: 10.0),
      itemBuilder:(context,index)=> const UserViewWidget(),
     itemCount: 5);
  }
}