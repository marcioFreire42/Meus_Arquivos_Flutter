import 'dart:math';

void main(List<String> args) {
  var par1 = 10;
  var par2 = "10";

  var somaPar = par1 + int.parse(par2);
  //O int.parse(Objec) converte um String para int;
  print(somaPar);

  var par3 = "0.5";

  var multiplicar = par1 * double.parse(par3);
  // O double.parse(Obj) converte um String para double;
  print(multiplicar);

  // Testa se um objeto é (is) um int, double ou outro typo;
  assert(num.parse("10") is int);
  assert(num.parse("10.05") is double);

  //Convertendo String para número;
  int numero = 42;
  print(numero.toString());
  assert(numero.toString() is String);

  // Double para String fixando quantidade de casas decimais;
  double numDecimal = 15.453289;
  print(numDecimal.toStringAsFixed(2));

  // Gerando números aleatórios;
  var randon = Random(); // Gera o objeto que será o sorteador;
  var numeroSorteado = randon.nextDouble(); // Sorteia de 0 a 1;
  print(numeroSorteado.toStringAsFixed(2));
  int numeroSorteadoInteiro = randon.nextInt(10); // Srteia de 0 a 10;
  bool boolSorteado = randon.nextBool(); //Sorteia true ou false;
  print("O inteiro foi o ${numeroSorteadoInteiro} e o bool foi $boolSorteado");

  print("FIM!!");
}
