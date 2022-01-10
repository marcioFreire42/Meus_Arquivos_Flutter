import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final TextEditingController _controllerTicker = TextEditingController();
  final TextEditingController _controllerCompanhia = TextEditingController();
  final TextEditingController _controllerCotacao = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Formulário')),
        body: Column(
          children: <Widget>[
            // A atribuição de criar textField foi passado para a função abaixo;
            // Os itens passados por referências são parâmetros opcionais;
            CriaCampo(
                controlador: _controllerTicker,
                rotulo: 'Ticker',
                dica: 'ABCD3'),
            CriaCampo(
              controlador: _controllerCompanhia,
              rotulo: 'Companhia',
              dica: 'Empresa Tal',
              borda: OutlineInputBorder(),
              icone: Icons.inventory_outlined,
              tipo: TextInputType.text,),
            CriaCampo(
              controlador: _controllerCotacao,
              rotulo: 'Cotação',
              dica: '0.00',
              borda: OutlineInputBorder(),
              icone: Icons.monetization_on,
              tipo: TextInputType.number,),
            ElevatedButton(
              onPressed: () {
                _CriaAtivo();
              },
              child:
                  const Text('Confirma', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: //Mudando a cor de fundo do butão;
                      MaterialStateProperty.all<Color>(Colors.deepOrange)),
            ),
          ],
        ),
      ),
    );
  }

  void _CriaAtivo() {
    final String? ticket = _controllerTicker.text;
    final String? companhia = _controllerCompanhia.text;
    final double? cotacao =
        double.tryParse(_controllerCotacao.text);
    
    if (ticket != null && companhia != null && cotacao != null) {
      final Ativo novoAtivo = Ativo(ticket, companhia, cotacao);
      // O Intellij sugeriu da forma abaixo ao invés de usar o IF;
      //  final Ativo novoAtivo = Ativo(ticket!, companhia!, cotacao!);
      debugPrint("$novoAtivo");
    } else {
      debugPrint('Erro no preenchimento, favor refazer');
    }
  }
}

class CriaCampo extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final OutlineInputBorder? borda;
  final IconData? icone;
  final TextInputType? tipo;

  CriaCampo(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
      this.borda,
      this.icone,
      this.tipo});

    // Os campos não utilizados não estão sendo passados por referência,
  // Estão como parametros opcionais.
  @override
  Widget build(BuildContext context) {
    return Padding(
      // adiciona margens personalizaveis;
      padding: const EdgeInsets.all(
          12.0), //EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16), poderia ser assim também,
      child: TextField(
        controller: controlador,
        style: const TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          //Decora o espaço que receberá o texto;
          labelText: rotulo,
          hintText: dica,
          icon: icone != null ? Icon(icone) : null,
          border: borda != null ? OutlineInputBorder() : null,
        ),
        keyboardType: tipo,
      ),
    );
  }
}

class Ativo {
  final String ticket;
  final String companhia;
  final double cotacao;

  Ativo(this.ticket, this.companhia, this.cotacao);

  @override
  String toString() {
    return 'Ativo{ticket: $ticket, companhia: $companhia, cotacao: $cotacao}';
  }
}
