import 'package:estudo2/screens/contacts_list.dart';
import 'package:estudo2/screens/dashboard.dart';
import 'package:estudo2/screens/new_contact.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';
import 'models/contact.dart';

void main() {
  runApp(const MyApp());
  // save(Contact(0, 'Márcio', 4366));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(
          secondary: Colors.blueAccent[700],
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary),
      ),
        // Um esquema de Tema foi criado para tenta passar a cor primaria;
        // Não de certo;
      home:
      // ContactsList()
      const Dashboard(),
      //NewContact()
    );
  }
}

