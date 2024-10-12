import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/Get%20it/setup_locator.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_in_model.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/sign_in_use_case.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/signup_use_case.dart';
import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/Auth/presentation/pages/signup.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/login%20widgets/forget_pass_text.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/login%20widgets/login_form.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/text_button_auth_account.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/login%20widgets/remeber_me_custom_widget.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:e_learning_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
    const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
  final GlobalKey<FormState> signInFormKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocProvider(create: (context)=>AuthCubit(getIt.get<SignUpUseCase>(),getIt.get<SignInUseCase>()),
    child: BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){
        if(state is AuthSignInSuccessState){
          CachHelper.saveData(key:'isLogin', value: true).then((value) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
          });
        }else if (state is AuthSignInErrorState){
          showSnackBar(context: context, message: state.errorMessage,);
        }
      },
      builder: (context,state){
            var readCubit=context.read<AuthCubit>();
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
                                  S.of(context).login_to_Account,
                                  style: TextStyle(
                                    fontSize: 40.0.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                         const SizedBox(height: 50,),
                         LoginForm(readCubit: readCubit, signInFormKey: signInFormKey, emailController: emailController,passwordController: passwordController,),
                          RememberMe(value: readCubit.isChecked,
                        onChanged: (value){
                          readCubit.rememberUserCheck(value);
                        },
                       ),      
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/7 , 0, 20.h),
                          child: CustomButton(
                            backgroundColor: AppColor.buttonColor,
                             width:MediaQuery.of(context).size.width,
                              text:S.of(context).sign_in,
                              onPressed: () {
                                  if (signInFormKey.currentState!.validate()) {
                                    readCubit.signIn(
                                     signInModel: SignInModel(
                                      email:emailController.text,
                                      password:passwordController.text,
                                     ) 
                                    );
                                  }
                                },
                    
                          ),),
                       ForgetPassText(context1:context),   
                          Center(
                            child:TextButtonAuthAccount(
                              size: MediaQuery.of(context).size,
                              text: S.of(context).not_have_account,
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
