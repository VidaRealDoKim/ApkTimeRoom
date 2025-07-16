import 'package:flutter/material.dart';

class Sala {
  final String nome;
  final DateTime data;
  final TimeOfDay horaInicio;
  final TimeOfDay horaFim;

  Sala({
    required this.nome,
    required this.data,
    required this.horaInicio,
    required this.horaFim,
  });
}
