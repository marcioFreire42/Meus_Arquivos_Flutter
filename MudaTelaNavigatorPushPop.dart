import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ListaDeTransferencia(),
        //FormularioTransferencia(),
        // Todo o conteúdo do body vai ser criado por esse método
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  FormularioTransferencia({Key? key}) : super(key: key);

  final TextEditingController _controladorCampoNumeroDaConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  // Controladores criados para capturar os campos a serem digitados;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroDaConta,
            rotulo: 'Número da conta',
            dica: '0000',
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
            borda: OutlineInputBorder(),
          ),
          ElevatedButton(
            onPressed: () {
              _CriaTransferencia(context);
            },
            child: Text('Clique Aqui', style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepOrange)),
          )
        ],
      ),
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
    );
  }

  void _CriaTransferencia(BuildContext context) {
    debugPrint('Clicou em Clique aqui!!');
    final int? conta = int.tryParse(_controladorCampoNumeroDaConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    // Com os controladores são String, capturamos com o .text e fazemos o parse necessário;

    if (conta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, conta);
      debugPrint('$transferenciaCriada');

      Navigator.pop(context, transferenciaCriada);
      // Exclui a tela do topo da pilha e envia para a anterior um objeto como referência;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$transferenciaCriada'),
        ),
      );
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;
  final OutlineInputBorder? borda;

  Editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica,
      this.icone,
      this.borda});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // envolve conteúdo com margens
      padding: const EdgeInsets.all(16.0), //Definindo as margens
      child: TextField(
        controller: controlador,
        style: const TextStyle(fontSize: 24.0), // Estilo da fonte;
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          border: borda != null ? OutlineInputBorder() : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaDeTransferencia extends StatelessWidget {
  const ListaDeTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          CriaCard(Transferencia(100.00, 1001)),
          CriaCard(Transferencia(250.00, 0002)),
          CriaCard(Transferencia(300.00, 5002)),
          // O método cria o Column e os cards são criados por outro método;
          // Notar que por referência está sendo CRIADO e passado um objeto;
        ],
      ),
      appBar: AppBar(
        title: const Text('Delivre'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          // Objeto future, com o Navigator chama outra tela e fica a espera de um retorno;

          future.then((transferenciaRecebida) {
              // O future.then recebe esse retorno e pode trabalhar com ele;
            debugPrint('Chegou o then do Future!');
            debugPrint('$transferenciaRecebida');
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CriaCard extends StatelessWidget {
  final Transferencia transf;
  const CriaCard(this.transf);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transf.valor.toString()),
        subtitle: Text(transf.numConta.toString()),
        // Os itens do card sendo preenchidos por atributos de um objeto.
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numConta;

  Transferencia(this.valor, this.numConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numConta: $numConta}';
  }
}
