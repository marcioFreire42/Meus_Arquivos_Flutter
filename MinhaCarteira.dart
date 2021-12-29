import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ListaAcoes(),
      ),
    );
  }
}

class ListaAcoes extends StatelessWidget {
  const ListaAcoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Carteira'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: CriaLista(),
    );
  }
}

class CriaLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Criacard(Acao('LREN3', 29.50, 200, 20.05)),
        Criacard(Acao('MGLU3', 6.50, 2200, 20.05)),
        Criacard(Acao('BIDI11', 29.50,a 180, 35.05)),
        Criacard(Acao('WEGE3', 17.50, 300, 35.05)),
      ],
    );
  }
}

class Criacard extends StatelessWidget {
  final Acao acao;
  const Criacard(this.acao);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(acao.ticker.toString()),
        subtitle: Text(acao.toString()),
      ),
    );
  }
}

class Acao {
  final String ticker;
  final double entrada;
  final double cotacao;
  final int quant;
  late double resultado;

  Acao(this.ticker, this.entrada, this.quant, this.cotacao) {
    resultado = ((cotacao * quant) - (entrada * quant));
  }

  @override
  String toString() {
    return 'Saldo de R\$ ${resultado.toStringAsFixed(2)}';
  }
}
