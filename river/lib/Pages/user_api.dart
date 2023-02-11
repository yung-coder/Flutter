// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:river/Pages/user.dart';

class UserE {
  final String name;
  final String email;
  const UserE({
    required this.name,
    required this.email,
  });

  UserE copyWith({
    String? name,
    String? email,
  }) {
    return UserE(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory UserE.fromMap(Map<String, dynamic> map) {
    return UserE(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserE.fromJson(String source) =>
      UserE.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserE(name: $name, email: $email)';

  @override
  bool operator ==(covariant UserE other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
