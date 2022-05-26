import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screnns/auth/auth_screen_.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCrDj7slJPYSuJdDwAiEvB73LuhQH0KBrA",
          authDomain: "flutter-chat-36135.firebaseapp.com",
          databaseURL: "https://flutter-chat-36135-default-rtdb.firebaseio.com",
          projectId: "flutter-chat-36135",
          storageBucket: "flutter-chat-36135.appspot.com",
          messagingSenderId: "398352123113",
          appId: "1:398352123113:web:c6a7dc89ff83825c44dc78",
          measurementId: "G-Y0LNC7T5XQ"
      )
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString('email');
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen()
  ));
}


