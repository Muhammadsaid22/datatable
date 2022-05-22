import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screnns/auth_screen_.dart';
import 'package:flutter_chat/screnns/kirish.dart';

import 'auth_screen_.dart';

class Service{
  final auth = FirebaseAuth.instance;
  void createUser(context,email,password)async{
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>

          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (builder)=> Kirish()),
                  (route) => false)
      );
    }

    catch(e){
      errorBox(context, e);
    }

  }

  void loginUser(context,email,password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value) =>
      {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (builder)=> Kirish()),
                (route) => false)
      }
      );
    }catch(e){
      errorBox(context, e);
    }
  }

  void signOut(context)async{
    try{
      await auth.signOut().then((value) =>
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute
            (builder: (context)=>AuthScreen()),
                  (route) => false)
      );
    }catch(e){
      errorBox(context, e);
    }
  }

  void errorBox(context,e){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Error !"),
        content: Text(e.toString()),
      );
    });
  }
}