import 'package:flutter/material.dart';
import 'package:minha_carteira/Modelos/Ativo.dart';
import 'package:minha_carteira/Screens/formulario.dart';
import 'package:minha_carteira/database/dao.dart';

class CarteiraBR extends StatefulWidget {
  @override
  State<CarteiraBR> createState() => _CarteiraBRState();
}

class _CarteiraBRState extends State<CarteiraBR> {
  final Dao _dao = Dao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteira Brasil'),
      ),
      body: FutureBuilder(
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Ativo> listaDeAcoes = snapshot.data as List<Ativo>;
              return ListView.builder(
                  itemCount: listaDeAcoes.length,
                  itemBuilder: (context, index) {
                    final Ativo ativo = listaDeAcoes[index];
                    return CriaCard(ativo);
                  });
          }
          return const Text('Erro desconhecido');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => Formulario('Adiciona Ativo BR'),
            ),
          )
              .then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}

class CriaCard extends StatelessWidget {
  final Ativo ativo;

  const CriaCard(this.ativo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Text>[
                Text(
                  ativo.nome.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Valor aportado de R\$ ${ativo.inicialValorAportado()}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ativos: ${ativo.quantPapeis.toString()}',
                  style: const TextStyle(fontSize: 16),
                ),
                Row(
                  children: <Text>[
                    const Text(
                      'Lucro: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      checaAtivo(ativo),
                      style: TextStyle(
                          fontSize: 16,
                          color: selectColor(ativo),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 4, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Text>[
                    const Text(
                      'Preço Médio: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      ativo.precoMedio.toString(),
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: <Text>[
                    const Text(
                      'Variação: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '${checaVariacao(ativo)}%',
                      style: TextStyle(
                          fontSize: 16,
                          color: selectColor(ativo),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color selectColor(Ativo ativo) {
    if (ativo.calculaLucro() > 0) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}

String checaAtivo(Ativo ativo) {
  return ativo.calculaLucro().toStringAsFixed(2);
}

String checaVariacao(Ativo ativo) {
  double variacao = ativo.variacao() * 100;
  return variacao.toStringAsFixed(2);
}
