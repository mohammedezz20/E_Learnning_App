class SignInModel {
  final String email;
  final String teacherId;
  final String password;

  SignInModel({
    required this.email,
    required this.teacherId,
    required this.password,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'],
      teacherId: json['teacherId'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'teacherId': teacherId,
      'password': password,
    };
  }
}
