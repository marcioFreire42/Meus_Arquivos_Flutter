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
  final List listadeAcoes = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    listadeAcoes.add(Acao('RAIL3', 7.15, 30, 8.50));
    listadeAcoes.add(Acao('LREN3', 8.15, 230, 18.50));
    listadeAcoes.add(Acao('PETR3', 70.15, 130, 78.50));
    listadeAcoes.add(Acao('WEGE3', 7.15, 300, 20.50));
    listadeAcoes.add(Acao('RAIL3', 7.15, 30, 8.50));
    listadeAcoes.add(Acao('LREN3', 8.15, 230, 18.50));
    listadeAcoes.add(Acao('PETR3', 70.15, 130, 78.50));
    listadeAcoes.add(Acao('WEGE3', 7.15, 300, 20.50));
    listadeAcoes.add(Acao('RAIL3', 7.15, 30, 8.50));
    listadeAcoes.add(Acao('LREN3', 8.15, 230, 18.50));
    listadeAcoes.add(Acao('PETR3', 70.15, 130, 78.50));
    listadeAcoes.add(Acao('WEGE3', 7.15, 300, 20.50));

    return ListView.builder(
      itemCount: listadeAcoes.length,
      // Aqui você diz a quantedade de itens que será criado pelo ListViewBuilder,
      // Se você está usando uma lista, o ideal é colocar o lista.length aqui
      itemBuilder: (BuildContext context, int index){
        // No item builder você tem que passar o context e o index;
        // O index é como um int contador que aumenta só
        // Podemos usar ele para ficar passando pelos elementos do list 
        final acao = listadeAcoes[index];
        return Criacard(acao);
      },
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
