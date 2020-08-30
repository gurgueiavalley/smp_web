import 'package:admin_chat/View/tela_login_cliente.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;

void main() {
  fb.initializeApp(
      apiKey: "AIzaSyCRAYn-Jx1dG0612uijdGTyLd_27aGZWBo",
      authDomain: "covid-4f1af.firebaseapp.com",
      databaseURL: "https://covid-4f1af.firebaseio.com",
      projectId: "covid-4f1af",
      storageBucket: "covid-4f1af.appspot.com",
      messagingSenderId: "732741908906",
      appId: "1:732741908906:web:628ef59472bab6fc0553d3");

  runApp(MyApp());
}

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
        '/': (context) => SignInCliente(),
      },
    );
  }
}
