import 'package:estudo/Componentes/ultimas_transferencias.dart';
import 'package:estudo/Screens/FormularioTransferencia.dart';
import 'package:estudo/Screens/ListaDeTransferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Componentes/card_saldo.dart';
import '../Componentes/saldo_object.dart';
import 'formulario_saldo.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard!')),
      body: ListView(children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: CardSaldo(),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                //value.adiciona(10.0);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return FormularioSaldo();
                }));
              },
              child: Text('Adiciona Valor!'),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FormularioTransferencia();
              }));
            }, child: Text("Transferir!"))
          ],
        ),
        UltimasTransferencias(),
      ]),
    );
  }
}
