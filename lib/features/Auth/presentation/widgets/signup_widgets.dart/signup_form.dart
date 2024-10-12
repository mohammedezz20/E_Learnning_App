import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/features/Auth/data/models/auth_controllers_model.dart';
import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  final AuthCubit readCubit;
  final AuthFormModel authControllers;

  const SignUpForm({
    super.key,
    required this.readCubit,
     required this.authControllers,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
             key: widget.authControllers.authFormKey,
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
                     border:9.0,
                     prefix:const Icon( Icons.person_outline_rounded),  
                     controller: widget.authControllers.firstNameController!,
                     hintText: S.of(context).email,
                     keyboardType: TextInputType.emailAddress,
                     validator: (value) {
                       return widget.readCubit.authValidator(value,'first name');
                     },
                   ),
                 ),
          
                 SizedBox(
                     width: double.infinity,
                   child:
                   CustomFormField(
                     sizedBoxHeight: 20,
                     controller:widget.authControllers.lastNameController!,
                     border: 9.0,
                     hintTextFontSize: 25.0.sp,
                     outLineBorderColor: AppColor.loginOptionBorder,
                     focusedBorderColor: AppColor.buttonColor,
                     backgroundColor: !CachHelper.getData(key: 'isDark')
                      ? const Color(0xfffafafa)
                      : const Color(0xff1f222a),
                      isPassword:false,
                     prefix:const Icon(Icons.person_outline_rounded),
                     hintText: S.of(context).password,
                     keyboardType: TextInputType.text,
                     validator: (value) {
                      return widget.readCubit.authValidator(value,'last name');
                     },                      
                     )
                 ),
           
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
                     border:9.0,
                     prefix:const Icon( Icons.email),
                     controller: widget.authControllers.emailController!,
                     hintText: S.of(context).email,
                     keyboardType: TextInputType.emailAddress,
                     validator: (value) {
                       return widget.readCubit.authValidator(value,'email address');
                     },
                   ),
                 ),
          
                 SizedBox(
                     width: double.infinity,
                   child:
                   CustomFormField(
                     sizedBoxHeight: 20,
                     controller:widget.authControllers.passwordController!,
                     border: 9.0,
                     hintTextFontSize: 25.0.sp,
                     outLineBorderColor: AppColor.loginOptionBorder,
                     focusedBorderColor: AppColor.buttonColor,
                     backgroundColor: !CachHelper.getData(key: 'isDark')
                      ? const Color(0xfffafafa)
                      : const Color(0xff1f222a),
                      isPassword: widget.readCubit.isPasswordVisible,
                     prefix:const Icon(Icons.lock_rounded),
                     hintText: S.of(context).password,
                     suffix: GestureDetector(
                     child:widget.readCubit.isPasswordVisible
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                          onTap: (){
                         widget.readCubit.changePassVisibility();
                         },
                     ),
                     keyboardType: TextInputType.visiblePassword,
                     validator: (value) {
                      return widget.readCubit.passwordValidator(value);
                     },                      
                     )
                 ),

                      SizedBox(
                     width: double.infinity,
                   child:
                   CustomFormField(
                     sizedBoxHeight: 20,
                     controller:widget.authControllers.passwordController!,
                     border: 9.0,
                     hintTextFontSize: 25.0.sp,
                     outLineBorderColor: AppColor.loginOptionBorder,
                     focusedBorderColor: AppColor.buttonColor,
                     backgroundColor: !CachHelper.getData(key: 'isDark')
                      ? const Color(0xfffafafa)
                      : const Color(0xff1f222a),
                      isPassword: widget.readCubit.isPasswordVisible,
                     prefix:const Icon(Icons.lock_rounded),
                     hintText: S.of(context).password,
                     suffix: GestureDetector(
                     child:widget.readCubit.isPasswordVisible
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                          onTap: (){
                         widget.readCubit.changePassVisibility();
                         },
                     ),
                     keyboardType: TextInputType.visiblePassword,
                     validator: (value) {
                      return widget.readCubit.passwordValidator(value);
                     },                      
                     )
                 ),
            
               ],
             ),
           );
           }
}