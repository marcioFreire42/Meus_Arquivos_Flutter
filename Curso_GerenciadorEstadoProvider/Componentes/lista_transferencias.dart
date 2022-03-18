import 'package:estudo/Componentes/Transferencia.dart';
import 'package:flutter/cupertino.dart';

class ListaTransferencias extends ChangeNotifier{
    final List<Transferencia> _lista = [];

    List<Transferencia> get lista => _lista;

    adiciona(Transferencia novaTransferencia){
      _lista.add(novaTransferencia);

      notifyListeners();
    }
}