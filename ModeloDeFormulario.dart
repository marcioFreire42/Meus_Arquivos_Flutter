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
            Padding( // adiciona margens personalizaveis;
              padding: const EdgeInsets.all(12.0), //EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16), poderia ser assim também,
              child: TextField(
                controller: _controllerTicker,
                style: const TextStyle(fontSize: 16.0),
                decoration: const InputDecoration( //Decora o espaço que receberá o texto;
                  labelText: "Ticker",
                  hintText: 'ABCD3',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: _controllerCompanhia,
                style: const TextStyle(fontSize: 16.0),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), //Adiciona bordas ao TextField;
                  labelText: "Companhia" ,
                  hintText: 'Empresa tal',
                  icon: Icon(Icons.inventory_outlined), // Adiciona Ícone;
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: _controllerCotacao,
                style: const TextStyle(fontSize: 16.0),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Cotação",
                  hintText: '0.00',
                  icon: Icon(Icons.monetization_on),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  final String? ticket = _controllerTicker.text;
                  final String? companhia = _controllerCompanhia.text;
                  final double? cotacao = double.tryParse(_controllerCotacao.text);

                  if (ticket!= null && companhia!= null && cotacao!= null){
                    final Ativo novoAtivo = Ativo(ticket, companhia, cotacao);
                    // O Intellij sugeriu da forma abaixo ao invés de usar o IF;
                    //  final Ativo novoAtivo = Ativo(ticket!, companhia!, cotacao!);
                  debugPrint("$novoAtivo");
                  } else {
                    debugPrint('Erro no preenchimento, favor refazer');
                  }
                },
                child: const Text('Confirma', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: //Mudando a cor de fundo do butão;
                MaterialStateProperty.all<Color>(Colors.deepOrange)),

            ),
          ],
        ),
      ),

    );
  }
}

class Ativo{
  final String ticket;
  final String companhia;
  final double cotacao;

  Ativo(this.ticket, this.companhia, this.cotacao);

  @override
  String toString() {
    return 'Ativo{ticket: $ticket, companhia: $companhia, cotacao: $cotacao}';
  }
}
