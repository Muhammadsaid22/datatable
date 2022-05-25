import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screnns/auth/auth_screen_.dart';

import 'auth_screen_.dart';
class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController email = TextEditingController();
  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 15),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    hintText: "Emailingizni kiriting !",
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
                  currentUser.sendPasswordResetEmail(email: email.text);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (builder)=> AuthScreen()),
                          (route) => false);
                },
                child: Text("O'zgartirish")),
          ],
        ),
      ),
    );
  }
}
