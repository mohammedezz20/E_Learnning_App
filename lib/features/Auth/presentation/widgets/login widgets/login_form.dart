import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  // final AuthCubit watchCubit;
  final AuthCubit readCubit;
  final BuildContext context1;
  final GlobalKey<FormState> signInFormKey;

  const LoginForm({
    super.key,
    // required this.watchCubit,
    required this.readCubit,
    required this.context1, required this.signInFormKey,
  });

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // widget.signInFormKey = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.signInFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: CustomFormField(
              sizedBoxHeight: 20,
              hintTextFontSize: 25.0.sp,
              outLineBorderColor: AppColor.loginOptionBorder,
              focusedBorderColor: AppColor.buttonColor,
              backgroundColor: !CachHelper.getData(key: 'isDark')
                  ? const Color(0xfffafafa)
                  : const Color(0xff1f222a),
              border: 9.0,
              prefix: const Icon(Icons.email),
              controller: emailController,
              hintText: S.of(widget.context1).email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                return widget.readCubit.emailValidator(value);
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CustomFormField(
              sizedBoxHeight: 20,
              controller: passwordController,
              border: 9.0,
              hintTextFontSize: 25.0.sp,
              outLineBorderColor: AppColor.loginOptionBorder,
              focusedBorderColor: AppColor.buttonColor,
              backgroundColor: !CachHelper.getData(key: 'isDark')
                  ? const Color(0xfffafafa)
                  : const Color(0xff1f222a),
              isPassword: widget.readCubit.isPasswordVisible,
              prefix: const Icon(Icons.lock_rounded),
              hintText: S.of(widget.context1).password,
              suffix: GestureDetector(
                child: widget.readCubit.isPasswordVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                onTap: () {
                  setState(() {
                    widget.readCubit.changePassVisibility();
                  });
                },
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                return widget.readCubit.passwordValidator(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
