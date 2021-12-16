import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Delivre'),
        ),
        body: const ListaDeTransferencia(),
        // Todo o conteúdo do body vai ser criado por esse método
        floatingActionButton: FloatingActionButton(
          onPressed: () {}, // É necessário, para rodar;
          child: const Icon(Icons.add),
        ),
      ),
    ));

class ListaDeTransferencia extends StatelessWidget {
  const ListaDeTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        CriaCard(Transferencia(100.00, 1001)),
        CriaCard(Transferencia(250.00, 0002)),
        CriaCard(Transferencia(300.00, 5002)),
        // O método cria o Column e os cards são criados por outro método;
        // Notar que por referência está sendo CRIADO e passado um objeto;
      ],
    );
  }
}

class CriaCard extends StatelessWidget {
  final Transferencia transf;
  CriaCard(this.transf);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transf.valor.toString()),
        subtitle: Text(transf.numConta.toString()),
        // Os itens do card sendo preenchidos por atributos de um objeto.
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numConta;

  Transferencia(this.valor, this.numConta);
}
