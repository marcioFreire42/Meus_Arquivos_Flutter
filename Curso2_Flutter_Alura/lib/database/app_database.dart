import 'package:estudo2/database/dao/contacts_dao.dart';
import 'package:estudo2/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSQL);
    },
    version: 1,
  );
}
// Criamos o banco de dados a partir de comandos SQL entendidos pelo sqflite;

