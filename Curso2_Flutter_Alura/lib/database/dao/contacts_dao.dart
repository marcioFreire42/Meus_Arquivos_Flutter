import 'package:estudo2/models/contact.dart';
import 'package:estudo2/database/app_database.dart';
import '../app_database.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao{

  static const String tableSQL = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER)';


  // Método para salvar itens no banco de dados;
  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    return _toMap(contact, db);
  }

  Future<int> _toMap(Contact contact, Database db) {
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
    return await _toList(db);
  }

  Future<List<Contact>> _toList(Database db) async {
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
}

// Lembrando que pra o DAO funcionar corretamente o database já deve existir.
// Exemplo de database abaixo.

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// Future<Database> getDatabase() async {
//   final String path = join(await getDatabasesPath(), 'bytebank.db');
//   return openDatabase(
//     path,
//     onCreate: (db, version) {
//       db.execute(ContactDao.tableSQL);
//     },
//     version: 1,
//   );
// }