import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Saldo extends ChangeNotifier{
  double value;

  Saldo(this.value);

  void adiciona(double valor){
    value += valor;

    notifyListeners();
  }
  
  void subtrai(double valor){
    value -= valor;
    
    notifyListeners();
  }

  String getCurrency(){
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }
}