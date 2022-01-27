import 'package:estudo2/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    }, version: 1,
    onDowngrade: onDatabaseDowngradeDelete);
    //Esse trecho apaga o conteúdo quando damos um downgrade na versão;
  });
}
// Criamos o banco de dados a partir de comandos SQL entendidos pelo sqflite;

// Método para salvar itens no banco de dados;
Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    // usa o create para acessar o banco;
    final Map<String, dynamic> contactMap = Map();
    // O banco não aceita qualquer tipo de objeto, mas acessa Map que é quase a mesma coisa;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.number;
    // Associa o Map ao contato recebido por referência;
    return db.insert('contacts', contactMap);
  });
}

// retornando todas as informações do BD em um List
// Acessamos o BD pelo createDatabase, usamos um query e passamos tudo para um MAP;
// Depois passamos por cada item do MAP com um for each;
// Cada item é transformado em um objeto e passado pra List devolvida ao fim.
Future<List<Contact>> findAll(){
  return createDatabase().then((db ) {
    return db.query('contacts').then((maps){
      final  List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps){
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}