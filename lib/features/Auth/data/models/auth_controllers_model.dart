import 'package:flutter/material.dart';

class AuthControllers {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;

  AuthControllers({
    this.emailController,
    this.passwordController,
    this.firstNameController,
    this.lastNameController,
  });
}