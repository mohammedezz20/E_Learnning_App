import 'package:e_learning_app/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomInputFeild extends StatelessWidget {
    final TextEditingController controller;
    final String? labelText;
    final IconData? suffixIcon;
    final IconData prefixIcon;
    final TextInputType? keyboardType;
    final bool? obscureText;
    final String? Function(String?)? validator;
    final VoidCallback? onTapSuffix;

  const CustomInputFeild({
    required this.controller,
    this.labelText,
    this.suffixIcon,
    required this.prefixIcon,
    this.keyboardType,
    this.obscureText,
    this.validator,
    this.onTapSuffix,
    super.key}
    );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10.h, 0, 10.h),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText??false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: GestureDetector(
            onTap: onTapSuffix,
            child: Icon(suffixIcon),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color:AppColor.buttonColor , width: 2.5),
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 25.0.sp),

        ),
      ),
    );
  }
}
