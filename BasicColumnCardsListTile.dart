import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delivre'),
        ), //AppBar;
        body: Column(
          children: const <Widget>[
            Card(
              child: ListTile(
                // Estrutura que agrupa alguns elementos, fica dentro do Card
                leading: Icon(Icons
                    .monetization_on), // leading item principa de destaque no inicio do ListTile
                title: Text('100.0'),
                subtitle: Text('0001'),
              ), // ListTile;
            ), // Card;
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('250.0'),
                subtitle: Text('0033'),
              ), // ListTile;
            ), // Card;
          ], // <Widget>[]
        ), // Column

        floatingActionButton: FloatingActionButton(
          onPressed: () {}, // É necessário, para rodar;
          child: Icon(Icons.add),
        ),
      ),
    ));
