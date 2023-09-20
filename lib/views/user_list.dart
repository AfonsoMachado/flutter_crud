import 'package:flutter/material.dart';
import 'package:flutter_crud/data/dummy_users_dart.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    const users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => Text(users.values.elementAt(i).name),
        itemCount: users.length,
      ),
    );
  }
}
