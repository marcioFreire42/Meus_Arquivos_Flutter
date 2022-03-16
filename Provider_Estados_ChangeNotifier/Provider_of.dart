ElevatedButton(onPressed: () {
              _CriaDeposito(context);
            }, child: Text('Confirmar!!'))
         // Código omitido!!
  }

  void _CriaDeposito(BuildContext context) {
    final double? valor = double.tryParse(_controladorValor.text);
    if(valor != null){
      _AtualizaValor(context, valor); // Testamos valores digitados, 
      Navigator.pop(context);
    }
  }

  void _AtualizaValor(context, valor) {
      // Aqui atiualizaremos uma informação dentro de um parametro;
      // Sendo assim não precisamos chamar o Consumer, que é usado em widgets;
      // Aqui acessamos as informações com um Provider.of;
      // Atualização só por baixo dos panos, deixe Consumer pra quem vai mostrar algo;
    Provider.of<Saldo>(context, listen: false).adiciona(valor);
  }