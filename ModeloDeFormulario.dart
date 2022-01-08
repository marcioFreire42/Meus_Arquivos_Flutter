import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulário')),
        body: Column(
          children: <Widget>[
            const Padding( // adiciona margens personalizaveis;
              padding: EdgeInsets.all(12.0), //EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16), poderia ser assim também,
              child: TextField(
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration( //Decora o espaço que receberá o texto;
                  labelText: "Ticker",
                  hintText: 'ABCD3',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
              child: TextField(
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  border: OutlineInputBorder(), //Adiciona bordas ao TextField;
                  labelText: "Companhia" ,
                  hintText: 'Empresa tal',
                  icon: Icon(Icons.inventory_outlined), // Adiciona Ícone;
                ),
                keyboardType: TextInputType.text,
              ),
            ),const Padding(
              padding: EdgeInsets.all(4.0),
              child: TextField(
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Valor",
                  hintText: '0.00',
                  icon: Icon(Icons.monetization_on),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            ElevatedButton(
                onPressed: null,
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
