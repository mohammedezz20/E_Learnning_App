import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/Get%20it/setup_locator.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/CustomFormField.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/Auth/presentation/pages/signup.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/text_button_auth_account.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/remeber_me_custom_widget.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:e_learning_app/home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
   final GlobalKey<FormState> signInFormKey = GlobalKey();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

    Login({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>AuthCubit(getIt.get<AuthRepository>()),
    child: BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){
      },
      builder: (context,state){
            var readCubit=context.read<AuthCubit>();
            var watchCubit=context.watch<AuthCubit>();
        return Scaffold(
        appBar: AppBar(
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, 
          color: CachHelper.getData(key: 'isDark')
             ?  const Color(0xfffafafa)
             :  const Color(0xff1f222a),),
          onPressed: () {
             Navigator.pop(context);
          },
        ),
      ),
      body: 
         SingleChildScrollView(
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
                                  S.of(context).login_to_your_account,
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
                                        hintTextFontSize: 25.0.sp,
                                     outLineBorderColor: AppColor.loginOptionBorder,
                                    focusedBorderColor: AppColor.buttonColor,
                                      backgroundColor: !CachHelper.getData(key: 'isDark')
                                     ? const Color(0xfffafafa)
                                     : const Color(0xff1f222a),
                                    border:9.0,
                                    prefix:const Icon( Icons.email),
                                    controller: emailController,
                                    hintText: S.of(context).email,
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
                                    controller:passwordController,
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
                              text:S.of(context).sign_in,
                              onPressed: () {
                                  if (signInFormKey.currentState!.validate()) {
                                    // readCubit.signIn(
                                    //   email: emailController.text,
                                    //   pass: passwordController.text
                                    // );
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
                   
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                              child: RichText(
                                text: TextSpan(
                                  text: S.of(context).forgot_the_password,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => print("go to sign up screen"),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                          
                          Center(
                            child:TextButtonAuthAccount(
                              size: MediaQuery.of(context).size,
                              text: S.of(context).dont_have_an_account,
                              textButton: S.of(context).sign_up,
                              navigationScreen: SignUp(),
                            )
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



