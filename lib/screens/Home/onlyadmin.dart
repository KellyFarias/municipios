import 'package:flutter/material.dart';


class OnlyAdmin extends StatefulWidget {

  @override
  _OnlyAdminState createState() => _OnlyAdminState();
}



class _OnlyAdminState extends State<OnlyAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Only Admin Area'),
    );
  }
}