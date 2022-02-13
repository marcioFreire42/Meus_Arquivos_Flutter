import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void findAll() async {
//   final Response response = await get(Uri.parse('http://192.168.1.20:8080/transactions/'));
//   print('O resultado é ${response.body}');
// }

void findAll() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.20:8080/transactions/'));
  print('O resultado é ${response.body}');
}
