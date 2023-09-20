import 'dart:math';

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

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null && _items.containsKey(user.id.toString())) {
      _items.update(user.id.toString(), (value) => user);
    } else {
      final id = Random().nextInt(1000);
      _items.putIfAbsent(
          id.toString(),
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }

    // Notificar o provider das mudanças
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id.toString());
      notifyListeners();
    }
  }
}
