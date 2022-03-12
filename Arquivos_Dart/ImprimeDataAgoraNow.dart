void main(){
  var now = DateTime();
  print('Hora certa é $now');
  // saída no console:  hora certa é 2021-12-04 18:45:53.534
  // Para imprimir só hora ou minutos, usar o seguinte
  print('A hora certa é $(now.hour):$(now.minute):$(now.second)');
}
