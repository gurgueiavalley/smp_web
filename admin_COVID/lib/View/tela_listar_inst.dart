import 'package:admin_chat/View/tela_instituicoes.dart';
import 'package:flutter/material.dart';

class TelaListarInstituicao extends StatefulWidget {
  @override
  _TelaListarInstituicaoState createState() => _TelaListarInstituicaoState();
}

class _TelaListarInstituicaoState extends State<TelaListarInstituicao> {
  ScrollController _scrollController = ScrollController();
  bool _inicio = false;

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
                    'Pesquisar Instituição',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Expanded(child: Container()),
                  FloatingActionButton.extended(
                    backgroundColor: Colors.green,
                    splashColor: Colors.white,
                    foregroundColor: Colors.white,
                    hoverColor: Colors.redAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaInstituicao(),
                        ),
                      );
                    },
                    label: Text('Adicionar nova Instituição'),
                    icon: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
              Text(
                'Busque sua asInstituição e faça alterações no cadastros',
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
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: 'Digite o nome da Instituição',
                            ),
                          ),
                        ),
                        for (var i = 0; i < 25; i++)
                          ListTile(
                            title: Text('Instituição'),
                            leading: CircleAvatar(),
                            subtitle: Text('Descrição'),
                            onTap: () {},
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
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
