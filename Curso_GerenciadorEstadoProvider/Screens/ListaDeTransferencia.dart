import 'package:estudo/Componentes/CriaCard.dart';
import 'package:estudo/Componentes/Transferencia.dart';
import 'package:estudo/Componentes/lista_transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FormularioTransferencia.dart';

class ListaDeTransferenciaState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Consumer<ListaTransferencias>(builder: (context, transferencias, child){
        return ListView.builder(
          itemCount:
          transferencias.lista.length, // Mostra o tamanho da ListView
          itemBuilder: (BuildContext context, int index) {
            final transferencia = transferencias.lista[index];
            return CriaCard(transferencia);
            // O itemBuilder constroi o elemento que será adicionado na lista,
            // Pegamos ele na lista pelo índice e retornamos no cria elemento;
          },
        );
      }),
      appBar: AppBar(
        title: const Text('Delivre'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}