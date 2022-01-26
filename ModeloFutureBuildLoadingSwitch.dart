import 'package:estudo2/database/app_database.dart';
import 'package:estudo2/models/contact.dart';
import 'package:estudo2/screens/new_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder( // Constriu e atualiza tela mesmo em Stateless
        future: findAll(), // Já deve ter um arquivo database com esse método;
        builder: (context, snapshot) {

            //Usaremos um switch para definir cada ação para cada estado;
          switch(snapshot.connectionState){

            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
            // Retornando uma tela de loading centralizada enquanto carrega;
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
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data as List<Contact>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return Criacard(contact);
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text("Erro desconhecido!!");
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NewContact();
          }));
          future.then((contatoRecebido) {
            debugPrint(contatoRecebido.toString());
            // setState(() {
              save(contatoRecebido);
            // });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Criacard extends StatelessWidget {
  final Contact contact;

  const Criacard(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name.toString()),
        subtitle: Text(contact.number.toString()),
      ),
    );
  }
}
