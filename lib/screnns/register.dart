import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_chat/screnns/auth_screen_.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_screen_.dart';
class Register extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ro'yhatdan o'tish sahifasi",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "Emailingizni kiritingl",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 15),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: "Parolingizni kiriting",

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 80)
                  ),
                  onPressed: ()async{
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    if(email.text.isNotEmpty && password.text.isNotEmpty){
                      service.createUser(context, email.text, password.text);
                      pref.setString("email", email.text);
                    }
                    else{
                      service.errorBox(context, "Please Fill all of them");
                    }
                  },
                  child: Text("Register")),
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthScreen()));
                  },
                  child: Text("Menda akkaunt bor."))
            ],
          ),
        ),
      ),
    );
  }
}
