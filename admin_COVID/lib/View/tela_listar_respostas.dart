import 'package:admin_chat/Model/cliente.dart';
import 'package:admin_chat/Model/resposta.dart';
<<<<<<< HEAD:admin_COVID/lib/View/tela_listar_respostas.dart
import 'package:admin_chat/Model/usuario.dart';
=======
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4:admin_COVID/lib/View/tela_cliente.dart
import 'package:admin_chat/Query/queryResposta.dart';
import 'package:admin_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TelaListarRespostas extends StatefulWidget {
  @override
  _TelaListarRespostasState createState() => _TelaListarRespostasState();
}

class _TelaListarRespostasState extends State<TelaListarRespostas> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _largura = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Inicio'),
        icon: Icon(Icons.arrow_upward),
        heroTag: null,
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.decelerate,
          );
        },
      ),
      body: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Filtar por Níveis de Casos',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Expanded(child: Container()),
<<<<<<< HEAD:admin_COVID/lib/View/tela_listar_respostas.dart
=======
<<<<<<< HEAD:admin_COVID/lib/View/tela_listar_respostas.dart
=======
                  Visibility(
                    visible: _largura >= 1000,
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.green,
                      splashColor: Colors.white,
                      foregroundColor: Colors.white,
                      hoverColor: Colors.redAccent,
                      onPressed: () {
                        Navigator.pushNamed(context, 'cadastrar_cliente');
                      },
                      label: Text('Adicionar um novo Usuário'),
                      icon: Icon(Icons.add),
                    ),
                    replacement: FloatingActionButton(
                      backgroundColor: Colors.green,
                      splashColor: Colors.white,
                      foregroundColor: Colors.white,
                      hoverColor: Colors.redAccent,
                      child: Icon(Icons.add),
                      onPressed: () {
                        Navigator.pushNamed(context, 'cadastrar_cliente');
                      },
                    ),
                  ),
>>>>>>> 22c0a3d7579edbc0cd35cec41cfb75f5568159b3:admin_COVID/lib/View/tela_cliente.dart
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4:admin_COVID/lib/View/tela_cliente.dart
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
              Text(
                'Busque por nível',
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 150,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                print(value);
                              });
                            },
                            controller: _editingController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                                hintText: 'Digite o nível',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.clear),
                                  onPressed: () {
                                    _editingController.clear();
                                    setState(() {});
                                  },
                                )),
                          ),
                        ),
<<<<<<< HEAD:admin_COVID/lib/View/tela_listar_respostas.dart
                        FutureBuilder(
                          future: hasuraConnect.query(
                            RespostaQuery().queryListarResposta(idInstituicao),
=======
                        StreamBuilder(
                          stream: hasuraConnect.subscription(
                            RespostaQuery().queryListarResposta(),
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4:admin_COVID/lib/View/tela_cliente.dart
                          ),
                          builder: (_, d) {
                            if (d.hasData) {
                              return ListView.builder(
                                shrinkWrap: true,
<<<<<<< HEAD:admin_COVID/lib/View/tela_listar_respostas.dart
                                itemCount: UsuarioModel.fromJson(d.data)
                                    .data
                                    .usuarios
                                    .length,
                                itemBuilder: (_, i) {
                                  if (UsuarioModel.fromJson(d.data)
                                      .data
                                      .usuarios
                                      .elementAt(i)
                                      .respostas
                                      .elementAt(0)
=======
                                itemCount: RespostaModel.fromJson(d.data)
                                    .data
                                    .respostas
                                    .length,
                                itemBuilder: (_, i) {
                                  if (RespostaModel.fromJson(d.data)
                                      .data
                                      .respostas
                                      .elementAt(i)
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4:admin_COVID/lib/View/tela_cliente.dart
                                      .resposta
                                      .contains(_editingController.text)) {
                                    return ListTile(
                                      title: Text(
<<<<<<< HEAD:admin_COVID/lib/View/tela_listar_respostas.dart
                                        'Nível: ${UsuarioModel.fromJson(d.data).data.usuarios.elementAt(i).respostas.elementAt(0).resposta.toString()}',
=======
                                        'Nível: ${RespostaModel.fromJson(d.data).data.respostas.elementAt(i).resposta}',
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4:admin_COVID/lib/View/tela_cliente.dart
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.black45,
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
<<<<<<< HEAD:admin_COVID/lib/View/tela_listar_respostas.dart
                                          'Nome: ${UsuarioModel.fromJson(d.data).data.usuarios.elementAt(i).nome.toString()} \n' +
                                              'Email: ${UsuarioModel.fromJson(d.data).data.usuarios.elementAt(i).email.toString()} '),
                                      onTap: () {},
=======
                                          'ID: ${RespostaModel.fromJson(d.data).data.respostas.elementAt(i).id}'),
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          'alterar_cliente',
                                          arguments:
                                              ClienteModel.fromJson(d.data)
                                                  .data
                                                  .clientes
                                                  .elementAt(i),
                                        );
                                      },
                                      trailing: Icon(Icons.edit),
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4:admin_COVID/lib/View/tela_cliente.dart
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              );
                            } else {
                              return CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.blue,
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
