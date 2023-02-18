// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Query {
  final String q;
  Query({
    required this.q,
  });

  Query copyWith({
    String? q,
  }) {
    return Query(
      q: q ?? this.q,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'q': q,
    };
  }

  factory Query.fromMap(Map<String, dynamic> map) {
    return Query(
      q: map['q'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Query.fromJson(String source) =>
      Query.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Query(q: $q)';

  @override
  bool operator ==(covariant Query other) {
    if (identical(this, other)) return true;

    return other.q == q;
  }

  @override
  int get hashCode => q.hashCode;
}

class queryNoifier extends StateNotifier<Query> {
  queryNoifier() : super(Query(q: ''));

  void updatequery(String n) {
    state = state.copyWith(q: n);
  }
}
