import 'dart:ui';
import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/app_bar.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/confirmation_dialog.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/reset_pass_image.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NewPasswordScreen extends StatelessWidget {
   NewPasswordScreen({super.key});
    final oldPassController = TextEditingController();
    final newPassController = TextEditingController();
    final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
        listener: (context,state){
          // if(state is Stu_Reset_Pass_SuccessState){
          //   if(state.statusCode==200){
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) =>
          //             SuccessfulResetPasswordScreen(),
          //       ));
          //   }
          // }
        },
       builder: (context,state){
          var watchCubit=context.watch<AuthCubit>();
          var readCubit=context.read<AuthCubit>();
          return Scaffold(
            backgroundColor: AppColor.lightBackgroundColor,
            body:  SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const ResetPasswordAppBar(),
                            const SizedBox(height: 10,),
                            const ResetPassImage(image:'assets/code.png',),
                       
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                                'Enter New Password',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 20
                                )
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                    
                         
                                CustomFormField(
                                  sizedBoxHeight: 20,
                                  controller:oldPassController,
                                  border: 9.0,
                                  hintTextFontSize: 25.0.sp,
                                  outLineBorderColor: AppColor.loginOptionBorder,
                                  focusedBorderColor: AppColor.buttonColor,
                                  backgroundColor: !CachHelper.getData(key: 'isDark')
                                   ? const Color(0xfffafafa)
                                   : const Color(0xff1f222a),
                                   isPassword: watchCubit.isPasswordVisible,
                                  prefix:const Icon(Icons.lock_rounded),
                                  hintText:  S.of(context).password,
                                  suffix: GestureDetector(
                                  child:watchCubit.isPasswordVisible
                                       ? const Icon(Icons.visibility_off)
                                       : const Icon(Icons.visibility),
                                       onTap: (){
                                      readCubit.changePassVisibility();
                                      },
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                   return watchCubit.passwordValidator(value);
                                  },                      
                                  ),

                                  CustomFormField(
                                  sizedBoxHeight: 20,
                                  controller:newPassController,
                                  border: 9.0,
                                  hintTextFontSize: 25.0.sp,
                                  outLineBorderColor: AppColor.loginOptionBorder,
                                  focusedBorderColor: AppColor.buttonColor,
                                  backgroundColor: !CachHelper.getData(key: 'isDark')
                                   ? const Color(0xfffafafa)
                                   : const Color(0xff1f222a),
                                   isPassword: watchCubit.isPasswordVisible,
                                  prefix:const Icon(Icons.lock_rounded),
                                  hintText:  S.of(context).password,
                                  suffix: GestureDetector(
                                  child:watchCubit.isPasswordVisible
                                       ? const Icon(Icons.visibility_off)
                                       : const Icon(Icons.visibility),
                                       onTap: (){
                                      readCubit.changePassVisibility();
                                      },
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                   return watchCubit.passwordValidator(value);
                                  },                      
                                  ),
                            const SizedBox(
                              height: 15,
                            ),
                           CustomButton(
                                onPressed: (){
                                      showDialog(
                                      context: context,
                                      builder: (context) => ConfirmCheckDialogContent(),
                                 );
                                  // if(formkey6.currentState!.validate()) {
                                  //   A.resetPass(
                                  //     context: context
                                  //       ,
                                  //       oldPass: oldPasscontroller.text,
                                  //       newPass: newPasscontroller.text);
                                  // }
                                },
                                text:'Submit', backgroundColor: AppColor.blueColor, width: double.infinity,
                              ),
                             
                    
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          );
       },
    );
  }
}
