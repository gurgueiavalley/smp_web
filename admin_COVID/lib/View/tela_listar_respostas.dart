import 'package:admin_chat/Model/cliente.dart';
import 'package:admin_chat/Model/resposta.dart';
import 'package:admin_chat/Model/usuario.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                        FutureBuilder(
                          future: hasuraConnect.query(
                            RespostaQuery().queryListarResposta(idInstituicao),
                          ),
                          builder: (_, d) {
                            if (d.hasData) {
                              return ListView.builder(
                                shrinkWrap: true,
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
                                      .resposta
                                      .contains(_editingController.text)) {
                                    return ListTile(
                                      title: Text(
                                        'Nível: ${UsuarioModel.fromJson(d.data).data.usuarios.elementAt(i).respostas.elementAt(0).resposta.toString()}',
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.black45,
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Text(
                                          'Nome: ${UsuarioModel.fromJson(d.data).data.usuarios.elementAt(i).nome.toString()} \n' +
                                              'Email: ${UsuarioModel.fromJson(d.data).data.usuarios.elementAt(i).email.toString()} '),
                                      onTap: () {},
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
