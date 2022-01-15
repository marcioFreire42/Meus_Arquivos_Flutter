import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaAcoes(),
      ),
    );
  }
}

  // Exemplo lista de Ações Stateful
class ListaAcoes extends StatefulWidget {
  ListaAcoes({Key? key}) : super(key: key);

  final List<Acao> _listadeAcoes = [];
  // Objeto que fica aqui poderá por outra classe usando o widget._listadeAcoes;

  @override
  State<StatefulWidget> createState(){
    return _ListaAcoesState();
  }
  // Método necessário para o funcionamento, o createState(),
  //Retorna a classe que extende está, o Intellij indica a linha abaixo,
  // Só que não funcionou pra mim.
  // _ListaAcoesState createState() => _ListaAcoesState();
}

class _ListaAcoesState extends State<ListaAcoes> {
  int number = 0;
  int quant = 100;
  double entrada = 10.0;
  double cotacao = 11.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Carteira'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          number++;
          quant = quant + 15;
          entrada = entrada + 0.15;
          cotacao = cotacao + 0.20;

          // O setState tem que ser chamado sempre que a tarefa for atualizar a tela;
          setState(() {
            widget._listadeAcoes.add(Acao('Empresa $number', entrada, quant, cotacao));
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: widget._listadeAcoes.length,
        itemBuilder: (BuildContext context, int index){
          final acao = widget._listadeAcoes[index];
          return Criacard(acao);
          // O ListView funciona normal, só que usando o widget._list...
        },
      ),
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
