import 'package:flutter/material.dart';

class AuthFormModel {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final GlobalKey? authFormKey;

  AuthFormModel({
    this.emailController,
    this.passwordController,
    this.firstNameController,
    this.lastNameController,
    this.authFormKey
  });
}