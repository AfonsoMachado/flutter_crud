import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users_dart.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Adicionar usuário',
        child: const Icon(Icons.add),
      ),
    );
  }
}
