class UserDataEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final int grade;
  final String teacherId;
  final String profilePicture;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserDataEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.grade,
    required this.teacherId,
    required this.profilePicture,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDataEntity.fromJson(Map<String, dynamic> json) {
    return UserDataEntity(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      grade: json['grade'] as int,
      teacherId: json['teacherId'] as String,
      profilePicture: json['profilePicture'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}
