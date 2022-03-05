import 'package:minha_carteira/Modelos/Ativo.dart';
import 'package:sqflite/sqflite.dart';

import 'carteira_database.dart';

class Dao {
  static const String tableSQL = 'CREATE TABLE acoesbrasil('
      'id INTEGER PRIMARY KEY, '
      'nome TEXT, '
      'quantpapeis INTEGER, '
      'precomedio DOUBLE, '
      'cotatual DOUBLE)';

  // Método que salva ativo na banco de dados;
  Future<void> save(Ativo ativo) async {
    final db = await getDatabase();
    await db.insert('acoesbrasil', ativo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    // Última linha trata conflito em caso de mesmo nome inserido duas vezes;
    // Nessa forma o toMap está dentro do Ativo, é mais reaproveitável.
    // Mas ele pode estar aqui no DAO, conforme exemplo Abaixo
  }

  // Future<int> save(Ativo ativo) async {
  //   final Database db = await getDatabase();
  //   return _toMap(ativo, db);
  // }
  //
  // Future<int> _toMap(Ativo ativo, Database db) {
  //   final Map<String, dynamic> ativoMap = Map();
  //   ativoMap['nome'] = ativo.nome;
  //   ativoMap['quantpapeis'] = ativo.quantPapeis;
  //   ativoMap['precomedio'] = ativo.precoMedio;
  //   ativoMap['cotatual'] = ativo.cotAtual;
  //   return db.insert('acoesbrasil', ativoMap);
  // }

  //Método que recuper todos os ativos;
  Future<List<Ativo>> findAll() async {
    final Database db = await getDatabase();
    //query todos os ativos da tabela
    final List<Map<String, dynamic>> maps = await db.query('acoesbrasil');
    // Agora convertemos a List<Map<String, dynamic>> para List<Ativo>;f
    return List.generate(maps.length, (index) {
      return Ativo(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
        quantPapeis: maps[index]['quantpapeis'],
        precoMedio: maps[index]['precomedio'],
        cotAtual: maps[index]['cotatual'],
      );
    });
  }

  // Outra forma de retornar todos os elemesntos, com o toList fora do findAll;

  // Future<List<Ativo>> findAll() async {
  //   final Database db = await getDatabase();
  //   return await _toList(db);
  // }
  //
  // Future<List<Ativo>> _toList(Database db) async {
  //   final List<Map<String, dynamic>> result = await db.query('acoesbrasil');
  //   final List<Ativo> lista = [];
  //   for (Map<String, dynamic> row in result) {
  //     final Ativo ativo = Ativo(row['id'],
  //       row['nome'],
  //       row['quantpapeis'],
  //       row['precomedio'],
  //       row['cotatual'],);
  //     lista.add(ativo);
  //   }
  //   return lista;
  // }
}
