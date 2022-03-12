import 'Ativo.dart';

void main(List<String> args) {
  var numero = <int>[];
  numero = [10, 20, 30, 40, 50, 60, 70];
  for (int i = 0; i <= 6; i++) {
    print(numero[i]);
  }

  var listaDeString = <String>["LREN3", "ABEV3", "MGLU3"];

  imprimeLista(listaDeString);

  // Para adicionar um item à list, use o add;
  listaDeString.add('BIDI11');
  print(listaDeString[3]);

  // Para adicionar mais de um use o addAll();
  listaDeString.addAll(['WEGE3', 'EGIE3']);
  print(
      "Os últimos itens adicionados foram: ${listaDeString[4]} e ${listaDeString[5]}");

  // Contar a quantidade de itens de uma LIST;
  print(listaDeString.length);

  // Localizar o índice de um determinado objeto indexOf
  var localiza = listaDeString.indexOf('MGLU3');
  print(localiza);

  // Remove um elemento da Lits, remove pelo número do índice
  // Então talvez seja necessário localizar sua posição pelo indexOf;
  listaDeString.removeAt(localiza);
  int quant = listaDeString.length;

  imprimeLista(listaDeString);

  // O remove também pode ao invés de passar um número de indíce passar o objeto
  listaDeString.remove('WEGE3');
  print('**************************');
  imprimeLista(listaDeString);

  // Limpando, excluindo todos os itens da lista.
  listaDeString.clear();
  imprimeLista(listaDeString);

  listaDeString.addAll(['GRND3', 'BIDI11', 'ABEV3', 'EGIE3', 'UGPA3', 'RAIL3']);
  listaDeString.sort(); // Organizando todos os elementos da lista;
  // A organização pode ser alfabetica ou numerica, o que couber;
  imprimeLista(listaDeString);

  var listaAtivos = <Ativo>[];

  Ativo lren3 = Ativo(22.15, 200, 'Lojas Renner');
  Ativo mglu3 = Ativo(7.50, 500, 'Magazine Luiza');
  Ativo abev3 = Ativo(23.50, 200, 'Cervejaria Ambev');
  Ativo grnd3 = Ativo(9.5, 1400, 'Grendene');
  Ativo egie3 = Ativo(49.50, 150, 'Engie');
  Ativo rail3 = Ativo(19.50, 300, 'Rumo Logistica');

  listaAtivos.addAll([lren3, mglu3, abev3, grnd3, egie3, rail3]);

  imprimeLista(listaAtivos);
  // listaAtivos.sort(); Erro de Exception;

  // Para ordenar List de Objetos, escolha o atributo que será usado na comparação;
  listaAtivos.sort((a, b) => a.nome.compareTo(b.nome));

  print('\nSegue lista organizada!');
  imprimeLista(listaAtivos);
}

void imprimeLista(var lista) {
  if (lista.isEmpty) {
    print('A lista está vazia');
  } else {
    var cont = 0;
    while (lista.length >= cont + 1) {
      print("Nome da empresa: ${lista[cont]};");
      cont++;
    }
  }
}
