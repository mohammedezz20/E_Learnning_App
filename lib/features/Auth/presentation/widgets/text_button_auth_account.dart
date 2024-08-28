import 'package:e_learning_app/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextButtonAuthAccount extends StatelessWidget {
  const TextButtonAuthAccount({
    super.key,
    required this.size,
    required this.text,
    required this.textButton,
    required this.navigationScreen
  });

  final Size size;
  final String text;
  final String textButton;
  final Widget navigationScreen; 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            text,
            style: TextStyle(
                fontSize: 15.sp,
                color: const Color(0xff939393),
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  navigationScreen,
                ),
              )
            },
            child:  Text(
              textButton,
              style: const TextStyle(
                  fontSize: 15,
                  color: AppColor.buttonColor,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
