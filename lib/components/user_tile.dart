import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl!.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl!));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  // Mandando o usuário como argumento para a rota
                  arguments: user,
                );
              },
              icon: const Icon(Icons.edit),
              color: Colors.orange,
              tooltip: 'Editar',
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: const Text('Excluir Usuário'),
                          content: const Text('Tem certeza?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('Não'),
                            ),
                            TextButton(
                              onPressed: () {
                                // O valor na função pop é passado para o then do showDialog
                                Navigator.of(context).pop(true);
                              },
                              child: const Text('Sim'),
                            ),
                          ],
                        )).then((confirmed) => {
                      if (confirmed)
                        {
                          // Remoção do usuário
                          Provider.of<UsersProvider>(context, listen: false)
                              .remove(user)
                        }
                    });
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
              tooltip: 'Deletar',
            ),
          ],
        ),
      ),
    );
  }
}
