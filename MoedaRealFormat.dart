class Saldo{ 
final double _value;
Saldo(this._value);

String getCurrency(double value){
    NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }
  //É necessário importar a dependência intl: no pubspec.yaml

}