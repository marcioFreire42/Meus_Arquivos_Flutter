import 'package:estudo/Componentes/Editor.dart';
import 'package:estudo/Componentes/Transferencia.dart';
import 'package:estudo/Componentes/lista_transferencias.dart';
import 'package:estudo/Componentes/saldo_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class FormularioTransferencia extends StatelessWidget {
  FormularioTransferencia({Key? key}) : super(key: key);

  final TextEditingController _controladorCampoNumeroDaConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  // Controladores criados para capturar os campos a serem digitados;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroDaConta,
              rotulo: 'Número da conta',
              dica: '0000',
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
              borda: OutlineInputBorder(),
            ),
            ElevatedButton(
              onPressed: () {
                _CriaTransferencia(context);
              },
              child: Text('Clique Aqui', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange)),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
    );
  }

  void _CriaTransferencia(BuildContext context) {
    final int? conta = int.tryParse(_controladorCampoNumeroDaConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (conta != null && valor != null && valor <= Provider.of<Saldo>(context, listen: false).value) {
      final transferenciaCriada = Transferencia(valor, conta);

      Provider.of<ListaTransferencias>(context, listen: false)
          .adiciona(transferenciaCriada);

      Provider.of<Saldo>(context, listen: false).subtrai(valor);
      Navigator.pop(context);
    }
  }
}
