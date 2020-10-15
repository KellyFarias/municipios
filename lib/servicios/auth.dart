import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:municipios/modelos/usuarios.dart';
import 'package:municipios/servicios/database/db_usuarios.dart';



class AuthService
{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  
  //Sign in email and passwd
Future signInWithEmailAndPassword(String email, String passwd) async {
    try
    {
      final UserCredential user = (await _auth.signInWithEmailAndPassword(email: email,password: passwd)) ;
      if(user != null)
      {


          return user;
      }
    } catch (e) {
      return null;
    }
  }
 Future register(String nom,String email,String passwd,String rol) async {
    try{
    final UserCredential user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: passwd,
    )) ;

        await DbUsuarios().userregister(user.user.uid.toString(),nom,email,rol);
        return user;
    }
    catch(e)
    {
      print("error:"+e.toString());
      return null;
    }
    /*if (!user.isAnonymous) {
      String idnew=user.uid.toString();
        print("Idnew"+idnew);
      return user;
    } else {
      return null;
    }*/
  }

   //Sign out
  void signOut() async {
    await _auth.signOut();
  }

  obtenerUserActual() async {
        final User useractual = _auth.currentUser;

        return useractual;

  }
  obtenerUserEmailActual() async {
        final User useractual = _auth.currentUser;

        return useractual.email;

  }
   obtenerUserUidActual() async {
        final User useractual = _auth.currentUser;

        return useractual.uid;

  }
}
  
 

