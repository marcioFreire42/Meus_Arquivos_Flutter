import 'package:estudo/Componentes/CriaCard.dart';
import 'package:estudo/Componentes/Transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FormularioTransferencia.dart';

class ListaDeTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaDeTransferenciaState();
  }
}

class ListaDeTransferenciaState extends State<ListaDeTransferencia> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount:
        widget._transferencias.length, // Mostra o tamanho da ListView
        itemBuilder: (BuildContext context, int index) {
          final transferencia = widget._transferencias[index];
          return CriaCard(transferencia);
          // O itemBuilder constroi o elemento que será adicionado na lista,
          // Pegamos ele na lista pelo índice e retornamos no cria elemento;
        },
      ),
      appBar: AppBar(
        title: const Text('Delivre'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            debugPrint('Chegou o then do Future!');
            debugPrint('$transferenciaRecebida');
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}