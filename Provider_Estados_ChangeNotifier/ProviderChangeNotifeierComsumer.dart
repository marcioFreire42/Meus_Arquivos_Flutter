// Primerio atualiza o pubspec.yaml com a dependência provider:

// Provider, ChangeNotifierProvider e Consumer
// No main fica assim:

import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (context) => Saldo(42.0),
    // O create cria o objeto que será trabalhado por todos os widgets;
  child: MyApp(), // Depois chama o widget principal que o runApp chamaria;
));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
    // Código omitido;

// A classe que está sendo trabalhada pelo objeto deve extender ChangeNotifier
class Saldo extends ChangeNotifier{
  final double valor;

  Saldo(this.valor);

  void adiciona(double value){
    valor += value;

    notifyListeners();
    // Sempre que o valor for atualizado na tela, devemos chamar esse metódo;
    // Ele avisa para todos que trabalham com o objeto que ele foi atualizado;
  }

  String getCurrency(){
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(valor);
  }
}

// O widget que vai trabalhar com o objeto criado deve estar envolvido por consumer;
child: Padding(
    padding: EdgeInsets.all(20.0),
    child: Consumer<Saldo>(builder: (context, value, child) {
        // Value é o objeto criado lá no main.dart, pode chamar como quiser;
        return Text(
            value.getCurrency(),
            // Trabalhando com o objeto chamamos ele pelo nome dado;
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
            ),
            );
