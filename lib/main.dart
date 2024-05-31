
import 'package:flutter/material.dart';
import 'views/dados_condutor.dart';
import 'views/main_screen.dart';
import 'views/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/main_screen': (context) => main_screen(),
      '/login': (context) => login(),
      '/dados_condutor':(context) => dados_condutor(codigo: '',)
    },
  ));
}

