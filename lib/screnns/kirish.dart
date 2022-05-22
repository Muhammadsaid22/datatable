import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screnns/sinf_qowiw.dart';
import 'package:flutter_chat/screnns/teachers.dart';

import 'change_password.dart';
import 'oquvchilar.dart';
class Kirish extends StatelessWidget {
  const Kirish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SinfQowiw()));
                  },
                  child: Container(
                    height: 140,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Text("O\'quvchilar",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                ),
                InkWell(
                  onTap: ((){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Teachers()));
                  }),
                  child: Container(
                    height: 140,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: Text("O\'qituvchilar",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
