import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:municipios/screens/Home/add_page.dart';
import 'package:municipios/screens/Home/list_data.dart';
import 'package:municipios/screens/Home/principal.dart';

class OnlyAdmin extends StatefulWidget {
  @override
  _OnlyAdminState createState() => _OnlyAdminState();
}

class _OnlyAdminState extends State<OnlyAdmin> {
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  /*Widget build(BuildContext context) {
    return Container(
       child: Text('Only Admin Area'),
    );
  }*/
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Example App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
              'https://sites.google.com/site/pseparacioniii/_/rsrc/1530894838731/home/Logo-TecNM-2017.png'),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.add_circle_outline,
              backgroundColor: Colors.black,
              text: 'Agregar',
              onPressed: () => _pushPage(context, AddPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child: SignInButtonBuilder(
              icon: Icons.list,
              backgroundColor: Colors.black,
              text: 'Listar',
              onPressed: () => _pushPage(context, ListPage()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
