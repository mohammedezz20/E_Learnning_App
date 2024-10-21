import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMe extends StatelessWidget {

  const RememberMe({
    required this.value,
    required this.onChanged,
    super.key});
  final bool value;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return    Padding(
        padding:  EdgeInsets.fromLTRB(0, 5, 0, 30.h),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Checkbox(
                value: value,
                activeColor: Colors.blue,
                onChanged:(value){
                   onChanged(value);
                   },                
              ),
               SizedBox(height: 50.h,),
               Text(
               S.of(context).remember_me,
                style: TextStyle(
                  fontSize: 18.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          );
    
  }
}