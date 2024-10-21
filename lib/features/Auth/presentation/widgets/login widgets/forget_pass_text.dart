import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/Auth/presentation/pages/ResetPassword/forget_password_screen.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassText extends StatelessWidget {
  const ForgetPassText({super.key, required this.context1});
  final BuildContext context1 ;
  @override
  Widget build(BuildContext context) {
    return    Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                              child: RichText(
                                text: TextSpan(
                                  text: S.of(context1).forgot_password,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =() =>    Navigator.push(
                                        context1,
                                        MaterialPageRoute(
                                          builder: (context){ 
                                            return   BlocProvider.value(
                                           value: context1.read<AuthCubit>(),
                                           child:const ForgetPasswordScreen()
                                          );}
                                        ),
                                      ),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          );  }
}