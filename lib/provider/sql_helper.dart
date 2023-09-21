import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<void> createTables(Database database) async {
    String sql = """CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        email TEXT,
        avatarUrl TEXT
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )""";

    database.execute(sql);
  }

  static Future<Database> db() async {
    return openDatabase('flutter_crud.db', version: 1,
        onCreate: (Database database, int version) async {
      await createTables(database);
    });
  }
}
