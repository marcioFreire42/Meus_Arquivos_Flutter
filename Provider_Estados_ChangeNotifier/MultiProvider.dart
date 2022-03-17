void main() => runApp(MultiProvider( // Acompanha mais de um objeto,
  providers: [ // Similar ao Children;
    ChangeNotifierProvider(
      create: (context) => Saldo(42.0),
    ),
    ChangeNotifierProvider(
      create: (context) => ListaTransferencias()
    ),
  ],
  child: MyApp(),
));

class myApp(){ // Código omitido;

void _CriaTransferencia(BuildContext context) {
    final int? conta = int.tryParse(_controladorCampoNumeroDaConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (conta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, conta);

      Provider.of<ListaTransferencias>(context, listen: false)
          .adiciona(transferenciaCriada);
          // Acessamos o elemento do tipo ListaTransferência do MultiProvider;

      Provider.of<Saldo>(context, listen: false).subtrai(valor);
            // Acessamos o elemento Saldo do Multiprovider;
            // Aqui não precisamos do notifyListner(), porque ele é já será 
            // Chamado dentro dos métodos subtrai() e adiciona();
      Navigator.pop(context);
    }
  }