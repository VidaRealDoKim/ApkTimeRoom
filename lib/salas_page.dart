import 'package:flutter/material.dart';

class SalasPage extends StatelessWidget {
  final List<String> salasUsuario = [
    'Sala de Reunião 01',
    'Sala de Estudos',
    'Sala de Planejamento',
  ];

  @override
  Widget build(BuildContext context) {
    return salasUsuario.isEmpty
        ? Center(child: Text('Você ainda não criou nenhuma sala.'))
        : ListView.builder(
      itemCount: salasUsuario.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(Icons.meeting_room),
            title: Text(salasUsuario[index]),
            subtitle: Text('ID: #00${index + 1}'),
          ),
        );
      },
    );
  }
}
