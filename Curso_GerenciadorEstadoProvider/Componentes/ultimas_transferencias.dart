import 'package:estudo/Componentes/lista_transferencias.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/ListaDeTransferencia.dart';
import 'CriaCard.dart';

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Ultimas Transferências:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Consumer<ListaTransferencias>(builder: (context, transferencias, child){
          final _ultimasTransferencias = transferencias.lista.reversed.toList();
          final quantidade = transferencias.lista.length;
          int tamanho = 2;
          if(quantidade < 3){
            tamanho = quantidade;
          }
          if(quantidade == 0){
            return const Card(
              margin: EdgeInsets.all(40),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Não há nenhuma transferência cadastrada!', textAlign: TextAlign.center,),
              ),
            );
          }
          return ListView.builder(
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: tamanho,
              itemBuilder: (context, indice){
                final transferenciaAtual = _ultimasTransferencias[indice];
                return CriaCard(transferenciaAtual);
              });
        },),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListaDeTransferenciaState();
              }));
            },
            child: Text("Lista Transferências!")),
      ],
    );
  }
}
