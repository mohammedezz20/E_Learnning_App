import 'package:flutter/material.dart';

class AuthControllers {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final GlobalKey? authFormKey;

  AuthControllers({
    this.emailController,
    this.passwordController,
    this.firstNameController,
    this.lastNameController,
    this.authFormKey
  });
}