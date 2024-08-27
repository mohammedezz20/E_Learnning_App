import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/features/Auth/domain/repositories/auth_repository.dart';
import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/Auth/presentation/pages/signup.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/remeber_me_custom_widget.dart';
import 'package:e_learning_app/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
   GlobalKey<FormState> signInFormKey = GlobalKey();
    Login({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>AuthCubit(AuthRepository()),
    child: BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){

      },
      builder: (context,state){
            var readCubit=context.read<AuthCubit>();
            var watchCubit=context.watch<AuthCubit>();
        return Scaffold(
        appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          //onPressed: () => Navigator.of(context).pop(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => (const signUp())),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                         Padding(
                          padding: EdgeInsets.fromLTRB(0, 20.h, 0, 40.h),
                          child:  Text(
                                "Login to Your \nAccount",
                                style: TextStyle(
                                  fontSize: 40.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        
                        Form(
                          key: signInFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                 width: double.infinity,
                                child: CustomFormField(
                                  sizedBoxHeight: 20,
                                    backgroundColor: !CachHelper.getData(key: 'isDark')
                                   ? const Color(0xfffafafa)
                                   : const Color(0xff1f222a),
                                  border:9.0,
                                  prefix:const Icon( Icons.email),
                                  controller: watchCubit.signInEmailController,
                                  labelText: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    return watchCubit.emailValidator(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                  width: double.infinity,
                                child:
                                CustomFormField(
                                  sizedBoxHeight: 20,
                                  controller:watchCubit.signInPasswordController,
                                  border: 9.0,

                                  backgroundColor: !CachHelper.getData(key: 'isDark')
                                   ? const Color(0xfffafafa)
                                   : const Color(0xff1f222a),
                                   isPassword: watchCubit.isPasswordVisible,
                                  prefix:const Icon(Icons.lock_rounded),
                                  labelText: 'Password',
                                  suffix: GestureDetector(
                                  child:watchCubit.isPasswordVisible
                                       ? const Icon(Icons.visibility)
                                       : const Icon(Icons.visibility_off),
                                       onTap: (){
                                      readCubit.changePassVisibility();
                                      },
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                   return watchCubit.passwordValidator(value);
                                  },
                                  
                                  // onTapSuffix: () {
                                  //   cubit.changePassVisibility();
                                  // },
                                  
                                  )
                              ),
                            ],
                          ),
                        ),
                     RemeberMe(
                      value: watchCubit.isChecked,
                      onChanged: (value){
                        readCubit.rememberUserCheck(value);
                      },
                     ),      
                     
                       Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 20.h),
                        child: CustomButton(
                          backgroundColor: AppColor.buttonColor,
                           width:MediaQuery.of(context).size.width,
                            text: 'Sign in',
                            onPressed: () {
                                if (signInFormKey.currentState!.validate()) {
                                  readCubit.signIn();
                                   Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) =>  HomeScreen(),
                                 ),
                                 );
                                  print('form submiitted');
                                }
                              },
                  
                        ),),
                     
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        //   child: SizedBox(
                        //     width: MediaQuery.of(context).size.width,
                        //     height: 50,
                        //     child: MaterialButton(
                        //       color:AppColor.buttonColor,
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(30.0),
                        //       ),
                        //       child: Text(
                        //         'Sign in',
                        //         style: TextStyle(
                        //             color: Colors.white, fontSize: 22),
                        //       ),
                        //       onPressed: () {
                        //         if (_formkey.currentState!.validate()) {
                        //           print('form submiitted');
                        //         }
                        //       },
                        //     ),
                        //   ),
                        // ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            child: RichText(
                              text: TextSpan(
                                text: "Forgot the password?",
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => print("go to sign up screen"),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 1),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Container(
                                    height: 2,
                                    color: Colors.grey[300],
                                  ),
                                ),
                                const Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    'or continue with',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    height: 2,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          print("go to facebook");
                                        },
                                        child: Container(
                                            height: 40,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors
                                                        .grey.shade300)),
                                            child: Image.asset(
                                              'assets/facebook.png',
                                            )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          print("go to google");
                                        },
                                        child: Container(
                                            height: 40,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors
                                                        .grey.shade300)),
                                            child: Image.asset(
                                              'assets/google.png',
                                            )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          print("go to apple");
                                        },
                                        child: Container(
                                            height: 40,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors
                                                        .grey.shade300)),
                                            child: Image.asset(
                                              'assets/apple.png',
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: "Don\'t have an account?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: " Sign up",
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => signUp()),
                                    ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        )
                      ])),
            ),
          ],
        ),
      ),
    );
 
      },
      
      )
    );
    
  }

}



