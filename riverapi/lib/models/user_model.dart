// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;
  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      firstname: json['first_name'] ?? 'First Name',
      lastname: json['last_name']  ?? 'Last Name',
      avatar: json['avatar'],
    );
  }
}
