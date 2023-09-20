import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  // Referência para o formulário
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id.toString();
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl!;
    }
  }

  UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    // pegando os argumento passados para a rota
    final User user = ModalRoute.of(context)?.settings.arguments as User;
    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          // Acessando referência para o formulário
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isValid = _form.currentState!.validate();
          if (isValid) {
            // Salva o conteúdo de cada input do formulário
            _form.currentState?.save();
            Provider.of<UsersProvider>(context, listen: false).put(User(
              id: _formData['id'] != null ? int.parse(_formData['id']!) : null,
              name: _formData['name']!,
              email: _formData['email']!,
              avatarUrl: _formData['avatarUrl'],
            ));
            Navigator.of(context).pop();
          }

          // Navigator.of(context).pop();
        },
        tooltip: 'Salvar usuário',
        child: const Icon(Icons.save),
      ),
    );
  }
}
