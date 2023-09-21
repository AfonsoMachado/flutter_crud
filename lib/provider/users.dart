import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/sql_helper.dart';

class UsersProvider {
  static Future<List<User>> getAllUsers() async {
    final db = await SQLHelper.db();
    List<Map<String, dynamic>> usersMap = await db.query('users');
    return List.generate(usersMap.length, (index) {
      return User(
          id: usersMap[index]["id"],
          name: usersMap[index]["name"],
          email: usersMap[index]['email'],
          avatarUrl: usersMap[index]["avatarUrl"]);
    });
  }

  static Future<int> insertUser(User user) async {
    int userId = 0;
    final db = await SQLHelper.db();
    await db.insert('users', user.toMap()).then((value) => userId = value);
    return userId;
  }

  static Future<void> deleteUser(String userId) async {
    final db = await SQLHelper.db();
    await db.rawDelete("DELETE FROM 'users' WHERE id = '$userId'");
  }
}
