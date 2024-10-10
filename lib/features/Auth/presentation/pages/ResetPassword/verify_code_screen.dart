import 'package:e_learning_app/config/themes/colors.dart';
import 'package:e_learning_app/core/utils/widgets/custom_button.dart';
import 'package:e_learning_app/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:e_learning_app/features/Auth/presentation/pages/ResetPassword/new_password_screen.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/app_bar.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/verify_code_form_field.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/verify_code_timer.dart';
import 'package:e_learning_app/features/Auth/presentation/widgets/reset%20pass%20widgets/reset_pass_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context1, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const ResetPasswordAppBar(),
                            const SizedBox(height: 10),
                            const ResetPassImage(image: 'assets/code.png'),
                            Text(
                              'Email verification !',
                              style: Theme.of(context1).textTheme.bodyMedium?.copyWith(
                                    fontSize: 35,
                                  ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Code has been sent to 010******16',
                              textAlign: TextAlign.center,
                              style: Theme.of(context1).textTheme.bodySmall?.copyWith(
                                    fontSize: 20,
                                  ),
                            ),
                            const SizedBox(height: 30),
                            const VerifyCodeFormField(),
                            const SizedBox(height: 20),
                            const TimerWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, bottom: 15, left: 15),
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context1,
                        MaterialPageRoute(
                          builder: (context) {
                            return BlocProvider.value(
                              value: context1.read<AuthCubit>(),
                              child: NewPasswordScreen(),
                            );
                          },
                        ),
                      );
                    },
                    text: 'Verify',
                    backgroundColor: AppColor.blueColor,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
