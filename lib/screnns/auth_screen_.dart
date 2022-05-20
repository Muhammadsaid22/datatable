import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screnns/change_password.dart';
import 'package:flutter_chat/screnns/firebase_helper.dart';
import 'package:flutter_chat/screnns/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthScreen extends StatelessWidget {
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
              Text("Login sahifa",
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
                      hintText: "Emailingizni kiriting",
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
                  onPressed: () async{
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    if(email.text.isNotEmpty && password.text.isNotEmpty){
                      service.loginUser(context, email.text, password.text);
                      pref.setString("email", email.text);
                    }
                    else{
                      service.errorBox(context, "Iltimos so'rovnomalarin to'ldiring !");
                    }
                  },
                  child: Text("Login")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                    },
                    child: Text("Menda hali akkaunt yo'q"),),
                  TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>ChangePassword()));
                      },
                      child: Text(
                        "Yangi parol",
                        style: TextStyle(
                            color: Colors.green
                        ),
                      ))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
