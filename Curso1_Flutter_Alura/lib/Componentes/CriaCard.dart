import 'package:flutter/material.dart';

import 'Transferencia.dart';

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
