import 'package:admin_chat/Model/instituicao.dart';
import 'package:admin_chat/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TelaInstituicao extends StatefulWidget {
  @override
  _TelaInstituicaoState createState() => _TelaInstituicaoState();
}

class _TelaInstituicaoState extends State<TelaInstituicao> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _lagura = MediaQuery.of(context).size.width;
    double _altura = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Icon(Icons.school),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Nova Instituição',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Cadastre uma nova Instituição, e ela estará disponivel no aplicativo.',
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Card(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 5, left: 50, top: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //color: Colors.red,
                            width: 230,
                            height: _altura * 0.7,
                            child: Column(
                              children: [
                                Container(
                                  height: 230,
                                  width: 230,
                                  color: Colors.grey,
                                  margin: EdgeInsets.only(bottom: 15),
                                  child: Icon(
                                    Icons.photo,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: 230,
                                  height: 50,
                                  color: Colors.blue,
                                  child: RaisedButton.icon(
                                    color: Colors.green,
                                    textColor: Colors.white,
                                    onPressed: () {},
                                    icon: Icon(Icons.cloud_upload),
                                    label: AutoSizeText(
                                      'Selecionar foto',
                                      wrapWords: true,
                                      maxFontSize: 50,
                                      minFontSize: 5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Prefira uma imagem com um formato png.',
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              //color: Colors.green,
                              //width: 250,
                              height: _lagura * 0.8,

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'NOME',
                                        hintText: 'Ex: Pedro',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'DESCRIÇÃO',
                                        hintText: 'Ex: Colégio Santos',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: double.maxFinite,
                                      child: RaisedButton.icon(
                                        onPressed: () {},
                                        icon: Icon(Icons.save),
                                        label: Text('Salvar'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
