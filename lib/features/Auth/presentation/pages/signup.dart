import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/Get%20it/setup_locator.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/core/utils/widgets/custom_snack_bar.dart';
import 'package:e_learning_app/features/Auth/data/models/auth_controllers_model.dart';
import 'package:e_learning_app/features/Auth/data/models/sign_up_model.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/sign_in_use_case.dart';
import 'package:e_learning_app/features/Auth/domain/usecases/signup_use_case.dart';
import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/signup_widgets.dart/signup_form.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/text_button_auth_account.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/login%20widgets/remeber_me_custom_widget.dart';
import 'package:e_learning_app/generated/l10n.dart';
import 'package:e_learning_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login.dart';

class SignUp  extends StatelessWidget {
   final GlobalKey<FormState> signUpFormKey = GlobalKey();
   final TextEditingController firstNameController = TextEditingController();
   final TextEditingController lastNameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   SignUp({super.key});
  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context)=>AuthCubit(getIt.get<SignUpUseCase>(),getIt.get<SignInUseCase>()),
    child: BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){
        if(state is AuthSignUpSuccessState){  
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  HomeScreen(),
                ),
                );
        }
        else if (state is AuthSignUpErrorState){
         showSnackBar(context:context,message: state.errorMessage,);
        }
      },
      builder: (context,state){
            var readCubit=context.read<AuthCubit>();
            var watchCubit=context.watch<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(Icons.arrow_back,
          color: CachHelper.getData(key: 'isDark')
             ?  const Color(0xfffafafa)
             :  const Color(0xff1f222a),
          
          ),
          onPressed: () {
           Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:  EdgeInsets.fromLTRB(0, 20.w, 0, 40.h),
                          child: Text(
                                S.of(context).create_account,
                                style: TextStyle(
                                  fontSize: 40.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                              
                        ),
                   
               SignUpForm(readCubit: readCubit, authControllers:
               AuthFormModel(
                 firstNameController: firstNameController,
                 lastNameController:  lastNameController,
                 emailController: emailController,
                 passwordController: passwordController,
                 authFormKey: signUpFormKey
               ),
               ),
                   RememberMe(
                    value: watchCubit.isChecked,
                    onChanged: (value){
                      readCubit.rememberUserCheck(value);
                    },
                   ),      
                     Padding(
                        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.04, 0, 15.h),
                      child: CustomButton(
                        backgroundColor: AppColor.buttonColor,
                         width:MediaQuery.of(context).size.width,
                          text: S.of(context).sign_in,
                          onPressed: () {
                              if (signUpFormKey.currentState!.validate()) {
                                readCubit.signUp(
                                 signUpModel: SignUpModel(
                                   firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    email: emailController.text,
                                   password: passwordController.text,
                                    grade: 0, 
                                 )
                                );
                              }
                            },
                                    
                      ),),
                        Center(
                        child:TextButtonAuthAccount(
                          size: MediaQuery.of(context).size,
                          text: S.of(context).already_have_account,
                          textButton: S.of(context).sign_in,
                          navigationScreen:  LoginScreen(),
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