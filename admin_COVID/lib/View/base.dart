import 'package:admin_chat/View/tela_listar_respostas.dart';
<<<<<<< HEAD
import 'package:admin_chat/constants.dart';
=======
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4
import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

class TelaBase extends StatefulWidget {
  @override
  Tela_BaseState createState() => Tela_BaseState();
}

class Tela_BaseState extends State<TelaBase> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NavigationRail(
            leading: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.04,
                    child: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$nome',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20,
                  ),
                ),
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
            extended: MediaQuery.of(context).size.width >= 1000 ? true : false,
            onDestinationSelected: (int index) {
              setState(() {
                if (index == 1) {
                  Navigator.pushReplacementNamed(context, '/');
                }
                _selectedIndex = index != 1 ? index : _selectedIndex;
                print(index);
              });
            },
            labelType: MediaQuery.of(context).size.width >= 1000
                ? null
                : NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                icon: Icon(IcoFontIcons.filter),
                selectedIcon: Icon(IcoFontIcons.filter),
                label: Text('Filtros'),
              ),
              NavigationRailDestination(
                icon: Icon(IcoFontIcons.signOut),
                selectedIcon: Icon(IcoFontIcons.signOut),
                label: Text('Sair'),
              ),
            ],
          ),
          VerticalDivider(
            thickness: 1,
            width: 0,
          ),
          VerticalDivider(
            thickness: 1,
            width: 80,
          ),

          // This is the main content.
          Expanded(
            child: pages(),
          ),

          VerticalDivider(
            thickness: 1,
            width: 80,
          ),
        ],
      ),
    );
  }

  Widget pages() {
    switch (_selectedIndex) {
      case 0:
        return TelaListarRespostas();
<<<<<<< HEAD
=======
        break;
      case 1:
        //Navigator.pushReplacement(
        //context, MaterialPageRoute(builder: (context) => SignInCliente()));
        Navigator.pushReplacementNamed(context, '/');
>>>>>>> 39d6b0c83558061c58ca98e0345c63815e06aea4
        break;
      default:
    }
  }
}
