
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;
  final OutlineInputBorder? borda;

  Editor(
      {required this.controlador,
        required this.rotulo,
        required this.dica,
        this.icone,
        this.borda});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // envolve conteúdo com margens
      padding: const EdgeInsets.all(16.0), //Definindo as margens
      child: TextField(
        controller: controlador,
        style: const TextStyle(fontSize: 24.0), // Estilo da fonte;
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          border: borda != null ? OutlineInputBorder() : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}



