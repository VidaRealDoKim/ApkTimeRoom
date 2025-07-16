import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final String nome = 'David Luis Kim';
  final String email = 'davidkim@gmail.com';

  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            SizedBox(height: 16),
            Text(
              nome,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(email),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit),
              label: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
