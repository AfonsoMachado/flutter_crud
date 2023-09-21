import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> _users = [];
  bool _isLoading = true;

  void _refreshUsers() async {
    final data = await UsersProvider.getAllUsers();
    setState(() {
      _users = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshUsers(); // Loading the diary when the app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => UserTile(_users.elementAt(i)),
        itemCount: _users.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.USER_FORM)
              .then((updated) => {
                    if (updated == true) {_refreshUsers()}
                  });
        },
        tooltip: 'Adicionar usuário',
        child: const Icon(Icons.add),
      ),
    );
  }
}
