import 'package:flutter/material.dart';
import '../Dashboard/models/sala.dart'; // <-- importa o modelo

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Sala> salas = [];

  void _criarSala() {
    String nomeSala = '';
    DateTime? dataSelecionada;
    TimeOfDay? horaInicio;
    TimeOfDay? horaFim;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              title: Text('Criar Nova Sala'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome da sala',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => nomeSala = value,
                  ),
                  SizedBox(height: 12),
                  ElevatedButton.icon(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final data = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2100),
                      );
                      if (data != null) {
                        setState(() => dataSelecionada = data);
                      }
                    },
                    label: Text(dataSelecionada == null
                        ? 'Selecionar Data'
                        : 'Data: ${dataSelecionada!.day}/${dataSelecionada!.month}/${dataSelecionada!.year}'),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: Icon(Icons.access_time),
                    onPressed: () async {
                      final hora = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (hora != null) {
                        setState(() => horaInicio = hora);
                      }
                    },
                    label: Text(horaInicio == null
                        ? 'Selecionar Horário de Início'
                        : 'Início: ${horaInicio!.format(context)}'),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton.icon(
                    icon: Icon(Icons.access_time_outlined),
                    onPressed: () async {
                      final hora = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (hora != null) {
                        setState(() => horaFim = hora);
                      }
                    },
                    label: Text(horaFim == null
                        ? 'Selecionar Horário de Fim'
                        : 'Fim: ${horaFim!.format(context)}'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nomeSala.isNotEmpty &&
                        dataSelecionada != null &&
                        horaInicio != null &&
                        horaFim != null) {
                      setState(() {
                        salas.add(Sala(
                          nome: nomeSala,
                          data: dataSelecionada!,
                          horaInicio: horaInicio!,
                          horaFim: horaFim!,
                        ));
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Criar'),
                ),
              ],
            );
          },
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
          final sala = salas[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.meeting_room, size: 32),
              title: Text(
                sala.nome,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data: ${sala.data.day}/${sala.data.month}/${sala.data.year}',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Início: ${sala.horaInicio.format(context)}  •  Fim: ${sala.horaFim.format(context)}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _criarSala,
        icon: Icon(Icons.add),
        label: Text('Nova Sala'),
        backgroundColor: Color(0xFF272525),
        foregroundColor: Colors.white,  // Cor do ícone/texto
      ),
    );
  }
}
