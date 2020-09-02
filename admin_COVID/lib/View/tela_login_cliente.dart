import 'package:admin_chat/Query/queryCliente.dart';
import 'package:admin_chat/View/base.dart';
import 'package:admin_chat/constants.dart';
import 'package:flutter/material.dart';

class SignInCliente extends StatefulWidget {
  @override
  _SignInClienteState createState() => _SignInClienteState();
}

class _SignInClienteState extends State<SignInCliente> {
  TextEditingController _login = TextEditingController();
  TextEditingController _senha = TextEditingController();

  GlobalKey<FormState> _formkey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: Form(
            key: _formkey,
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ...[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Faça o Login',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextFormField(
                        controller: _login,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Seu login',
                          labelText: 'Login',
                        ),
                        validator: (value) {
                          if (value.isEmpty) return "O campo é obrigatório";
                          if (value.length < 5)
                            return "O campo precisa de mais de 5 caracteres";
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _senha,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) return "O campo é obrigatório";
                          if (value.length < 3)
                            return "O campo precisa de mais de 5 caracteres";
                          return null;
                        },
                      ),
                      FlatButton(
                        child: Text('Sign in'),
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            print('botao clicado');
                            var dados = await hasuraConnect.query(ClienteQuery()
                                .queryLoginCliente(_login.text, _senha.text));
                            var tam = dados['data']['clientes'].length;
                            print(dados['data']);
                            idInstituicao =
                                dados['data']['clientes'][0]['idInstituicao'];
                            nome = dados['data']['clientes'][0]['login'];
                            if (tam == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TelaBase()),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Text("Erro"),
                                      content:
                                          Text("Login e/ou Senha inválido(s)"),
                                      actions: <Widget>[
                                        FlatButton(
                                            child: Text("OK"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            })
                                      ]);
                                },
                              );
                            }
                            /* var dados = await hasuraConnect
                                .query(ClienteQuery().queryLogin());
                            print(dados['data']);
                            var tam = dados['data']['clientes'].length;
                            print(tam);
                            for (var i = 0; i < tam; i++) {
                              if (dados['data']['clientes'][i]['login'] ==
                                      _login.text &&
                                  dados['data']['clientes'][i]['senha'] ==
                                      _senha.text) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TelaBase()),
                                );
                              }
                            } */
                          }
                        },
                      ),
                    ].expand(
                      (widget) => [
                        widget,
                        SizedBox(
                          height: 24,
                        )
                      ],
                    )
                  ],
                ),
              ),
=======
      body: Form(
        key: _formkey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ...[
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Faça o Login',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextFormField(
                    controller: _login,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Seu login',
                      labelText: 'Login',
                    ),
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                      if (value.length < 5)
                        return "O campo precisa de mais de 5 caracteres";
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _senha,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                      if (value.length < 3)
                        return "O campo precisa de mais de 5 caracteres";
                      return null;
                    },
                  ),
                  FlatButton(
                    child: Text('Sign in'),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        print('botao clicado');
                        var dados = await hasuraConnect.query(ClienteQuery()
                            .queryLoginCliente(_login.text, _senha.text));
                        var tam = dados['data']['clientes'].length;
                        print(dados['data']);
                        if (tam == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TelaBase()),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  title: Text("Erro"),
                                  content: Text("Login e/ou Senha inválido(s)"),
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        })
                                  ]);
                            },
                          );
                        }
                        /* var dados = await hasuraConnect
                            .query(ClienteQuery().queryLogin());
                        print(dados['data']);
                        var tam = dados['data']['clientes'].length;
                        print(tam);
                        for (var i = 0; i < tam; i++) {
                          if (dados['data']['clientes'][i]['login'] ==
                                  _login.text &&
                              dados['data']['clientes'][i]['senha'] ==
                                  _senha.text) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TelaBase()),
                            );
                          }
                        } */
                      }
                    },
                  ),
                ].expand(
                  (widget) => [
                    widget,
                    SizedBox(
                      height: 24,
                    )
                  ],
                )
              ],
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(message),
        actions: [
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
