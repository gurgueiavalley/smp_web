import 'package:admin_chat/Model/cliente.dart';
import 'package:admin_chat/View/base.dart';
import 'package:admin_chat/View/tela_alterar_cliente.dart';
import 'package:admin_chat/View/tela_cad_cliente.dart';
import 'package:admin_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import 'Model/instituicao.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TelaBase(),
        'cadastrar_cliente': (context) => TelaCadCliente(),
        'alterar_cliente': (context) => TelaAlterarCliente(
              clientes: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
