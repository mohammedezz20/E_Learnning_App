class UserModel {
  final String profileImg;
  final String email;
  final String phone;
  final String name;
  final Map<String, dynamic> address;

  UserModel({
    required this.profileImg,
    required this.email,
    required this.phone,
    required this.name,
    required this.address,
  });


  //TODO fromJson
}
