import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screnns/auth/auth_screen_.dart';
import 'package:flutter_chat/screnns/kirish.dart';
import 'package:flutter_chat/screnns/auth/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyC3PamA0LhxdGce2M464_OYqhYPyiMdkNs',
          appId: '1:398352123113:android:9dc703bbffd1991444dc78',
          messagingSenderId: 'messagingSenderId',
          projectId: 'flutter-chat-36135'
      )
  );
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString('email');
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Kirish()
  ));
}


