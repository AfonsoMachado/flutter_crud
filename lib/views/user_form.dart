import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        centerTitle: true,
      ),
    );
  }
}
