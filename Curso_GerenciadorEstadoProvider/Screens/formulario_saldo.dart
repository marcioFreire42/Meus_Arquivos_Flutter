
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Componentes/Editor.dart';
import '../Componentes/saldo_object.dart';

final TextEditingController _controladorValor = TextEditingController();


class FormularioSaldo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Saldo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
              borda: OutlineInputBorder(),
            ),
            ElevatedButton(onPressed: () {
              _CriaDeposito(context);
            }, child: Text('Confirmar!!'))
          ],
        ),
      ),
    );
  }

  void _CriaDeposito(BuildContext context) {
    final double? valor = double.tryParse(_controladorValor.text);
    if(valor != null){
      _AtualizaValor(context, valor);
      Navigator.pop(context);
    }
  }

  void _AtualizaValor(context, valor) {
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }
}

