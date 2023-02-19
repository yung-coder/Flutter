import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      lastname: json['last_name'] ?? 'Last Name',
      avatar: json['avatar'],
    );
  }
}

class QueryModel {
  final int q;
  QueryModel({
    required this.q,
  });

  factory QueryModel.fromMap(Map<String, dynamic> map) {
    return QueryModel(
      q: map['q'] as int,
    );
  }

  QueryModel copyWith({
    int? q,
  }) {
    return QueryModel(
      q: q ?? this.q,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'q': q,
    };
  }

  String toJson() => json.encode(toMap());

  factory QueryModel.fromJson(String source) =>
      QueryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QueryModel(q: $q)';

  @override
  bool operator ==(covariant QueryModel other) {
    if (identical(this, other)) return true;

    return other.q == q;
  }

  @override
  int get hashCode => q.hashCode;
}

class QueryNotifier extends StateNotifier<QueryModel> {
  QueryNotifier() : super(QueryModel(q: 0));

  void updateQusery(int n) {
    state = state.copyWith(q: n);
  }
}
