import 'package:e_learning_app/core/utils/api_constants.dart';

class RestPassModel {
  final String email;
  String teacherId=APIConstants.testTeacherId;
  final String otp;
  final String password;

  RestPassModel({
    required this.email,
    required this.otp,
    required this.password,
  });

  factory RestPassModel.fromJson(Map<String, dynamic> json) {
    return RestPassModel(
      email: json['email'],
      otp: json['otp'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'teacherId': teacherId,
      'otp': otp,
      'password': password,
    };
  }
}
