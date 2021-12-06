import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  @override
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  // Para parâmteros necessários que não podem ser nulos, utilizamos o required no construtor, para parâmteros que podem ser nulos, declaramos seu tipo com ?, assumindo que podem receber valores nulos
  const Editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icone});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
      ),
    );
  }
}