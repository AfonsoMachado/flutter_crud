import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users_dart.dart';
import 'package:flutter_crud/models/user.dart';

// Padrão observer: sempre que houver uma mudança no map de usuários,
// os listners são notificados e a interface de usuário é atualizada com os novos dados
class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }
}
