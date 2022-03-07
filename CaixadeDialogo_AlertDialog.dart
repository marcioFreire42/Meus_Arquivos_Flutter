import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  const TransactionAuthDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Autenticador!'),
      content: const TextField(
        obscureText: true,
        // Para substiruir o texto por *, usado em senhas;
        maxLength: 4,
        // Indica o tamanho que o campo pode ter;
        decoration: InputDecoration(
            labelText: 'Senha', hintText: '0000', border: OutlineInputBorder()),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(
            fontSize: 60, letterSpacing: 30 // Espaçamento entre letras;
            ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              print('Cancelado');
            },
            child: const Text('Cancelar')),
        TextButton(
            onPressed: () {
              print('Continuado');
            },
            child: Text('Continuar'))
      ],
    );
  }
}
