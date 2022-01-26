import 'package:estudo2/database/app_database.dart';
import 'package:estudo2/models/contact.dart';
import 'package:estudo2/screens/new_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// class ContactsList extends StatefulWidget {
//   // const ContactsList({Key? key}) : super(key: key);
//
//   // final List<Contact> _listaDeContatos = [];
//
//   @override
//   State<ContactsList> createState() => _ContactsListState();
// }

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
          // Podemos testar se o snapshot.data é null,
          // Apenas se não for é que executaremos o restante do código,
          // Isso permite uma tela de loading ao final do IF.          
          if (snapshot.data != null){
            final List<Contact> contacts = snapshot.data as List<Contact>;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Contact contact = contacts[index];
                return Criacard(contact);
              },
              itemCount: contacts.length,
            );
          }
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
