import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> salas = [];

  void _criarSala() {
    showDialog(
      context: context,
      builder: (context) {
        String nomeSala = '';
        return AlertDialog(
          title: Text('Nova Sala'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Digite o nome da sala'),
            onChanged: (valor) {
              nomeSala = valor;
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nomeSala.trim().isNotEmpty) {
                  setState(() {
                    salas.add(nomeSala);
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Criar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: salas.isEmpty
          ? Center(child: Text('Nenhuma sala criada ainda.'))
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: salas.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.meeting_room),
              title: Text(salas[index]),
            ),
          );
        },
      ),

      /// Aqui está o botão no canto inferior direito
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _criarSala,
        label: Text('Nova Sala'),
        icon: Icon(Icons.add),
        backgroundColor: Color(0xFF272525), // Cor do botão
        foregroundColor: Colors.white,  // Cor do ícone/texto
      ),
    );
  }
}
