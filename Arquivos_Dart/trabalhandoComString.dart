import 'dart:math';

void main(List<String> args) {
  String frase = "Seja livre, seja delivre";

  //string.contains("trecho") analisa se o texto possui o trecho;
  if (frase.contains("livre")) {
    print("Contém sim!!");
  } else {
    print("Não contém não!!");
  }

  // Para verifocar se a String começa com determinado trecho.
  if (frase.startsWith("Seja")) {
    print("Começa com o trecho desejado");
  }

  // Para verificar se termina com o trecho desejado;
  if (frase.endsWith("delivre")) {
    print("Término da frase está OK");
  }

  //Para verificar se o trecho começa no index indicado;
  if (frase.indexOf("delivre") == 17) {
    print("Começa no lugar certo!!");
  } else {
    print("Começa no lugar ERRADO!!");
  }

  // Split substitui o trecho em referência por um ", "
  var trecho = frase.split("e");
  print(trecho);

  // Para contar a quantidade de trechos que são blocos separados por virgulas;
  // Use o string.length;
  print(trecho.length);

  // Convertendo Maiúsculas para minúsculas e vice-versa!;
  var maiusculas = "TUDO MAIUSCULA!!";
  var minusculas = "tudo minuscula!!";

  print(maiusculas.toLowerCase());
  print(minusculas.toUpperCase());

  // Apagar espaços antes e depois da String; meio sem serventia;
  var testeTrim = " teste dos espaços ";
  print(testeTrim.trim());

  // Para saber se um String está vazio use o isEmpity();
  // E para saber se não está vazio use o teste lógico com isNotEmpity();

  assert("".isEmpty);
  assert(" ".isNotEmpty);
  print("FIM!!");

  // Teste da substituição de trecho em String
  // Use o replaceAll(RegExp("Trecho a ser subs"), "Treque que vai ficar");
  var texto = "E obrigado pelos peixes!";
  print(texto);
  var novoTexto =
      texto.replaceAll(RegExp(" pelos peixes!"), "! (Som de golfinho)");
  print(novoTexto);

  // Escrevendo uma String
  // Adicionamos mais trechos a umas mesma String e finalizamos com toString;
  var sb = StringBuffer();
  sb.write("Obrigado");
  sb.write(" pelos ");
  sb.write("peixes!!");
  print(sb);
  sb.write(" E adeus!!");
  print(sb);
}
