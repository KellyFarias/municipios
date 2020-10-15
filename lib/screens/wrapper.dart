import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:municipios/screens/Authenticate/login.dart';
import 'package:municipios/screens/Home/principal.dart';

class Wrapper extends StatelessWidget {
  
  const Wrapper({Key key}) : super(key: key);
  
    //Sign in or Home

  @override
  Widget build(BuildContext context) {
    
    return Login();
  }
}