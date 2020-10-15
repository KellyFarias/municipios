import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_signin_button/button_builder.dart';
import 'package:municipios/modelos/usuarios.dart';
import 'package:municipios/screens/Authenticate/login.dart';
import 'package:municipios/servicios/auth.dart';
import 'package:municipios/servicios/database/db_usuarios.dart';



/// Entrypoint example for registering via Email/Password.
class RegisterPage extends StatefulWidget {
  /// The page title.
  final String title = 'Registration';
  
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  
  AuthService authserv=new AuthService();
    String dropdownValue = 'General';
    String userId='';
  bool _success;
  


  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _nombreController,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                  setState(() {
                  dropdownValue = newValue;
                  });
                  },
                  items: <String>['Administrador', 'General']
                  .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
                }).toList(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: SignInButtonBuilder(
                      icon: Icons.person_add,
                      backgroundColor: Colors.pink[200],
                      onPressed: () async{
                        if (_formKey.currentState.validate()) {

                          
                        dynamic result = await authserv.register(_nombreController.text,_emailController.text,_passwordController.text,dropdownValue);
                         
                         
                         if(result.user!=null)
                         {

                           print("El usuario es"+result.user.uid);
                           print("Registro exitoso");
                           _nombreController.clear();
                           _emailController.clear();
                           _passwordController.clear();
                           
                           _success=true;
                         
                         }
                        }
                      },
                      text: 'Register',
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                        child: Text(_success == null
                        ? ''
                        : (_success
                            ? 'Successfully registered '
                            : 'Registration failed')),

                  )
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Example code for registration.
  
}