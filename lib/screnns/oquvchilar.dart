import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Oquvchilar extends StatefulWidget {

  @override
  _OquvchilarState createState() => _OquvchilarState();
}

class _OquvchilarState extends State<Oquvchilar> {
  List<dynamic> data = [];
  List<dynamic> rate = [];
  Service service = Service();
  List<dynamic> sana = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final TextEditingController name_controller = TextEditingController();
  final TextEditingController pupil_name_controller = TextEditingController();
  final TextEditingController rate_controller = TextEditingController();
  final TextEditingController group_controller = TextEditingController();
  final TextEditingController time_controller = TextEditingController();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daomad',
          style: TextStyle(
              color: Colors.black
          ),),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.only(top: 25,left: 10,right: 10,bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 160,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            hintMaxLines: 1,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            labelText: 'Ism'
                        ),
                        controller: name_controller,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 160,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            labelText: 'Guruh'
                        ),
                        controller: group_controller,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 160,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)
                            ),
                            labelText: 'Dars vaqti'
                        ),
                        controller: time_controller,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 30,
                    ),
                    Row(
                      children: [
                        RaisedButton(
                            child: Text("O\'chirish"),
                            color: Colors.red,
                            onPressed: (){
                              if(count > 1){
                                data.remove(count-1);
                                count--;
                              }
                              setState(() {

                              });
                            }),
                      ],
                    ),

                    RaisedButton(
                        child: Text("Qo\'shish"),
                        color: Colors.green,
                        onPressed: (){
                          count++;

                          data.add({
                            'controller':[
                              for(int i = 0; i<count;i++){
                                for(int j = 0;j<131;j++){
                                  rate.add({
                                    "controller2": [
                                      for (int i = 1; i < 131; i++)
                                        {
                                          TextEditingController(),
                                        }
                                    ]}),},
                                TextEditingController(),
                              }
                            ]
                          });


                          setState(() {

                          });
                        }),
                    SizedBox(
                      width: 30,
                    ),
                    RaisedButton(
                        child: Text("Saqlash"),
                        color: Colors.blue,
                        onPressed: () async {
                          List<String> dataStrings = [];
                          List<String> rateStrings = [];
                          List<String> sanaStrings = [];
                          data.forEach((element) {
                            dataStrings.add(element['controller'][0].text);
                          });
                          rate.forEach((element) {
                            rateStrings.add(element['controller2'][0].text);
                          });
                          sana.forEach((element) {
                            sanaStrings.add(element.text);
                          });
                          print(dataStrings);
                          print(rateStrings);
                          print(sanaStrings);
                          return;
                          final  responce = await http.post(
                              Uri.parse('https://flutter-chat-36135-default-rtdb.firebaseio.com/pupils.json'),
                              body: jsonEncode(
                                  {
                                    "name":name_controller.text,
                                    "time":time_controller.text,
                                    "tutorial":group_controller.text,
                                    "nameOfStudent": jsonEncode(data),
                                    "dateOfStudent":jsonEncode(sana),
                                    "rateOfStudent":jsonEncode(rate)
                                  }
                              )
                          );
                          final  getresponec = await http.get(
                            Uri.parse('https://flutter-chat-36135-default-rtdb.firebaseio.com/pupils.json'),

                          );
                          print(responce.body);
                          print(getresponec.body);
                        }
                    ),

                  ],
                ),
              ),
              SizedBox(height: 30,),
              /* Text("Jami o\'quvchilar soni : ${count.toString()}",
                  style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )
              ),*/
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(
                              child: Text('Sana',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26
                                ),),
                            )
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width*70,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: 50,
                              itemBuilder: (context,index)=>Container(
                                height: 100,
                                width: 30,
                                padding: EdgeInsets.only(left: 8,bottom: 6),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Center(
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding:
                                        EdgeInsets.only(left: 2, bottom: 18),
                                      ),

                                      controller: sana[index],
                                    ),
                                  ),
                                ),
                              )),

                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*.8,
                      width: MediaQuery.of(context).size.width*75,
                      child: ListView.builder(
                          itemCount: count,
                          itemBuilder: (context,index) => Row(
                            children: [
                              Container(
                                height: 30,
                                width: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding:
                                    EdgeInsets.only(left: 2, bottom: 18),
                                  ),
                                  controller: data[index][count],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width*70,
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 50,
                                    itemBuilder: (context,index)=>Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.only(left: 8,bottom: 6),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black)
                                      ),
                                      child: Center(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding:
                                            EdgeInsets.only(left: 2, bottom: 18),
                                          ),

                                          controller: rate[index][0],
                                        ),
                                      ),
                                    )),

                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
