import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Player {
  final String name;
  final String socketID;
  final double points;
  final String playerType;
  Player({
    required this.name,
    required this.socketID,
    required this.points,
    required this.playerType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'socketID': socketID,
      'points': points,
      'playerType': playerType,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['name'] ?? "",
      socketID: map['socketID'] ?? "",
      points: map['points'] ?? "",
      playerType: map['playerType'] ?? "",
    );
  }

  Player copyWith({
    String? name,
    String? socketID,
    double? points,
    String? playerType,
  }) {
    return Player(
      name: name ?? this.name,
      socketID: socketID ?? this.socketID,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}
