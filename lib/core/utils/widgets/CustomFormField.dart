import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/extensions/sized_box_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  var controller = TextEditingController();
  String hintText;
  String labelText;
  bool isPassword;
  TextInputType keyboardType;
  Widget? suffix;
  Widget? prefix;
  int? maxLines;
  String? Function(String?)? validator;
  Function(PointerDownEvent)? onTapOutside;
  Color backgroundColor;
  double? border;
  double sizedBoxHeight;
  bool enabled;

  CustomFormField(
      {super.key,
      required this.controller,
      this.hintText = '',
      this.labelText = '',
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.suffix,
      this.prefix,
      this.maxLines = 1,
      this.validator,
      this.backgroundColor = Colors.white,
      this.onTapOutside,
      this.border,
      this.sizedBoxHeight = 0.0,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          onTapOutside: onTapOutside,
          validator: validator,
          maxLines: maxLines,
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelStyle: Theme.of(context).textTheme.bodySmall,
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: const Color(0xffAAAAAA)),
            fillColor: backgroundColor,
            filled: true,
            enabled: enabled,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border ?? 10),
              borderSide: BorderSide(color: backgroundColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border ?? 10),
              borderSide: BorderSide(color: backgroundColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border ?? 10),
              borderSide: BorderSide(color: backgroundColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border ?? 10),
              borderSide: BorderSide(color: backgroundColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border ?? 10),
              borderSide: BorderSide(color: backgroundColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border ?? 10),
              borderSide: BorderSide(color: backgroundColor),
            ),
            suffixIcon: suffix,
            prefixIcon: prefix,
          ),
        ),
        sizedBoxHeight.h.sizedBoxHeight,
      ],
    );
  }
}
