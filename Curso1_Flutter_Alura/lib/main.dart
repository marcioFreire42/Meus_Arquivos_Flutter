import 'package:flutter/material.dart';

import 'Screens/ListaDeTransferencia.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ).copyWith(
          secondary: Colors.blueAccent[700],
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
        )
      ),
      home: ListaDeTransferencia(),
      //FormularioTransferencia(),
      // Todo o conteúdo do body vai ser criado por esse método
    );
  }
}


