class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final int grade;
  final String teacherId;

  SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.grade,
    required this.teacherId,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'grade': grade,
      'teacherId': teacherId,
    };
  }

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      grade: json['grade'] as int,
      teacherId: json['teacherId'] as String,
    );
  }
}
