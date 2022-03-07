import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  TransactionAuthDialog({required this.onConfirm});
    // Função requerida na chamada, vai receber um String;
    // e vai devolver para o chamador do dialog o valor digitado

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Autenticador!'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        // Para substituir o texto por *, usado em senhas;
        maxLength: 4,
        // Indica o tamanho que o campo pode ter;
        decoration: InputDecoration(border: OutlineInputBorder()),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontSize: 60, letterSpacing: 30 // Espaçamento entre letras;
            ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar')),
        TextButton(
            onPressed: () {
              widget.onConfirm(_passwordController.text);
                // Valor digitado é atribuido na function.
              Navigator.pop(context);
            },
            child: Text('Continuar'))
      ],
    );
  }
}

// O chamador da Caixa de Diálogo acontece da seguinte forma:
showDialog(
    context: context, 
    builder: (context){
        return TransactionAuthDialog(onConfirm: (String password) {
        print('A senha é $password');
        },);

// Assim como para chamar outra tela usamos o Navigator, para caixa de diálogo showDialog;