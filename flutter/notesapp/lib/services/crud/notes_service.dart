import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart' show join;

class DatabaseAlreadyOpenException implements Exception {}

class UnableToGetDocumentDirectory implements Exception {}

class DatabaseIsNotOpen implements Exception {}

class NotesService {
  Database? _db;

  

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      return db;
    }
  }

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      await db.close();
      _db = null;
    }
  }

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenException();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;

      await db.execute(createUserTable);

      await db.execute(createNoteTable);
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentDirectory();
    }
  }
}

@immutable
class DatabaseUser {
  final int id;
  final String email;
  const DatabaseUser({required this.id, required this.email});

  DatabaseUser.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        email = map[emailColumn] as String;

  @override
  String toString() => 'Person , ID = $id , email = $email';

  @override
  bool operator ==(covariant DatabaseUser other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class DatabaseNote {
  final int id;
  final int userId;
  final String content;

  DatabaseNote({
    required this.id,
    required this.userId,
    required this.content,
  });

  DatabaseNote.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        userId = map[userIdColumn] as int,
        content = map[textColumn] as String;

  @override
  String toString() => 'Note, ID = $id , userId = $userId';

  @override
  bool operator ==(covariant DatabaseNote other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

const dbName = 'test.db';
const noteTable = 'note';
const userTable = 'user';
const idColumn = "id";
const emailColumn = 'email';
const userIdColumn = 'user_id';
const textColumn = 'content';
const createUserTable = '''CREATE TABLE if not EXISTS "user" (
	"id"	INTEGER,
	"email"	TEXT
); ''';

const createNoteTable = '''CREATE TABLE "note" (
	"id"	INT NOT NULL,
	"user_id"	INT,
	"content"	TEXT,
	FOREIGN KEY("user_id") REFERENCES "user"("id"),
	PRIMARY KEY("id")
); ''';
