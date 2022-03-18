import 'package:estudo/Screens/dashboart_screem.dart';
import 'package:estudo/Screens/formulario_saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Componentes/lista_transferencias.dart';
import 'Componentes/saldo_object.dart';
import 'Screens/ListaDeTransferencia.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => Saldo(42.0),
    ),
    ChangeNotifierProvider(
      create: (context) => ListaTransferencias()
    ),
  ],
  child: MyApp(),
));

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
      home: Dashboard(),
      //FormularioTransferencia(),
      // Todo o conteúdo do body vai ser criado por esse método
    );
  }
}


