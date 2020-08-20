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
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  //ScrollController _controller = ScrollController();
  PageController _pageController = PageController();

  String query = """
    subscription MySubscription {
      instituicoes {
        descricao
        id
        img
        nome
      }
    }

  """;

  @override
  Widget build(BuildContext context) {
    /* return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              //Assign the controller to my scrollable widget
              controller: _controller,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          FlutterWebScroller(
            //Pass a reference to the ScrollCallBack function into the scrollbar
            scrollCallBack,

            //Add optional values
            scrollBarBackgroundColor: Colors.white,
            scrollBarWidth: 15.0,
            dragHandleColor: Colors.black38,
            dragHandleBorderRadius: 3.0,
            dragHandleHeight: 150.0,
            dragHandleWidth: 5.0,
          ),
        ],
      ),
    ); */

    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            leading: Column(
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.04,
                  backgroundImage: NetworkImage(
                    'https://cdni.rt.com/actualidad/public_images/2016.07/article/579ae067c36188ce6e8b4576.jpg',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Maria',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                Divider(
                  color: Colors.white,
                )
              ],
            ),
            selectedLabelTextStyle: TextStyle(
              color: Colors.blueAccent,
            ),
            unselectedLabelTextStyle: TextStyle(
              color: Colors.black45,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.black45,
            ),
            selectedIconTheme: IconThemeData(
              color: Colors.blueAccent,
            ),
            selectedIndex: _selectedIndex,
            extended: MediaQuery.of(context).size.width > 1000 ? true : false,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
                print(_selectedIndex);
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                );
              });
            },
            labelType: MediaQuery.of(context).size.width > 1000
                ? null
                : NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(IcoFontIcons.doctor),
                selectedIcon: Icon(IcoFontIcons.doctor),
                label: Text('Casos'),
              ),
              NavigationRailDestination(
                icon: Icon(IcoFontIcons.chartBarGraph),
                selectedIcon: Icon(IcoFontIcons.chartBarGraph),
                label: Text('Gráfico'),
              ),
              NavigationRailDestination(
                icon: Icon(IcoFontIcons.check),
                selectedIcon: Icon(IcoFontIcons.check),
                label: Text('Atendidos'),
              ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 1,
          ),

          // This is the main content.
          Expanded(
            child: Center(
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    //color: Colors.amber,
                    child: StreamBuilder(
                      stream: hasuraConnect.subscription(query),
                      builder: (_, d) {
                        if (d.hasData) {
                          return ListView.builder(
                            itemCount: Instituicao.fromJson(d.data)
                                .data
                                .instituicoes
                                .length,
                            itemBuilder: (_, i) {
                              return ListTile(
                                title: Text(
                                  Instituicao.fromJson(d.data)
                                      .data
                                      .instituicoes
                                      .elementAt(i)
                                      .nome,
                                ),
                                subtitle: Text(
                                  Instituicao.fromJson(d.data)
                                      .data
                                      .instituicoes
                                      .elementAt(i)
                                      .descricao,
                                ),
                              );
                            },
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          VerticalDivider(
            thickness: 1,
            width: 50,
          ),
        ],
      ),
    );
  }
}
