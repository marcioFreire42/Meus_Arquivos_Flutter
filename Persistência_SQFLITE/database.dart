import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao.dart';

Future<Database> getDatabase() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  // WidgetsFlutterBinding.ensureInitialized();
  final String path = join(await getDatabasesPath(), 'carteira.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(Dao.tableSQL);
    },
    version: 2,
    onDowngrade: onDatabaseDowngradeDelete,
    // Apaga todo o banco de dados quando mudamos para versão inferior;
  );
}
