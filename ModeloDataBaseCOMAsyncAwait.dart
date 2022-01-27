import 'package:estudo2/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
  );
}
// Criamos o banco de dados a partir de comandos SQL entendidos pelo sqflite;

// Método para salvar itens no banco de dados;
Future<int> save(Contact contact) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.number;
  return db.insert('contacts', contactMap);
}

// retornando todas as informações do BD em um List
// Acessamos o BD pelo createDatabase, usamos um query e passamos tudo para um MAP;
// Depois passamos por cada item do MAP com um for each;
// Cada item é transformado em um objeto e passado pra List devolvida ao fim.
Future<List<Contact>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<Contact> contacts = [];
  for (Map<String, dynamic> row in result) {
    final Contact contact = Contact(
      row['id'],
      row['name'],
      row['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;
}