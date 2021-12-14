import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delivre'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {}, // É necessário, para rodar;
          child: Icon(Icons.add),
        ), //FloatinfActionButter
      ), // Scaffold
    )); // MaterialApp;
