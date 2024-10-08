import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResetPasswordAppBar extends StatelessWidget {
  const ResetPasswordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
                IconButton(onPressed: (){Navigator.pop(context);},
                 icon:  const FaIcon(FontAwesomeIcons.angleLeft,size: 30,),),
              const SizedBox(width: 10,),
              Text(
            'Reset Password',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 30.sp
            )
        ),],);
  }
}