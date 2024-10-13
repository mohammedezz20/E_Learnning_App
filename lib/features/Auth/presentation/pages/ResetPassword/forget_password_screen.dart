import 'dart:ui';
import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/Auth/presentation/pages/ResetPassword/verify_code_screen.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/app_bar.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/reset_pass_image.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
     return BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){
      },
      builder: (context1,state){
            var watchCubit=context1.watch<AuthCubit>();
      return Scaffold(
          body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                       const ResetPasswordAppBar(),
                       
                          const SizedBox(
                            height: 15,
                          ),
                          const ResetPassImage(image: 'assets/forgetpassword.png',),
                          Text(
                            S.of(context1).enter_email,textAlign: TextAlign.center,
                              style: Theme.of(context1).textTheme.bodySmall?.copyWith(
                                  fontSize: 22.sp
                              )
                          ),
                          const SizedBox(
                            height:35,
                          ),
                         Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child:CustomFormField(
                                    sizedBoxHeight: 20,
                                    controller:phoneController,
                                    border: 9.0,
                                    hintTextFontSize: 25.0.sp,
                                    outLineBorderColor: AppColor.loginOptionBorder,
                                    focusedBorderColor: AppColor.buttonColor,
                                    backgroundColor: !CachHelper.getData(key: 'isDark')
                                     ? const Color(0xfffafafa)
                                     : const Color(0xff1f222a),
                                    prefix:const Icon(Icons.email_outlined),
                                    hintText:  S.of(context1).email,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                     return watchCubit.authValidator(value,"email address");
                                    },                      
                                    )
                       ),
                             SizedBox(
                            height:MediaQuery.of(context1).size.height/6,
                          ),
                          CustomButton(
                            onPressed: (){
                             Navigator.push(
                                context1,
                                MaterialPageRoute(
                                  builder: (context){ 
                                    return   BlocProvider.value(
                                   value: context1.read<AuthCubit>(),
                                   child:const VerifyCodeScreen()
                                  );}
                                ),
                              );
                            },
                            text:S.of(context).send, backgroundColor: AppColor.blueColor, width: double.infinity,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
         
        );
     });
     
      }
  }

