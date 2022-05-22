import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/screnns/kirish.dart';
import 'package:flutter_chat/screnns/sinf_qowiw.dart';
import 'package:http/http.dart'as http;
class Teachers extends StatefulWidget {
    @override
  _TeachersState createState() => _TeachersState();
}
class _TeachersState extends State<Teachers> {

  TextEditingController name_controller = TextEditingController(text: '');
  TextEditingController pupil_name_controller = TextEditingController(text: '');
  TextEditingController rate_controller = TextEditingController(text: '');
  TextEditingController group_controller = TextEditingController(text: '');
  TextEditingController time_controller = TextEditingController(text: '');
  int count = 0;
  bool isLoading = true;
  final List<InfoPupils> loadedOrders = [];

  @override
  void initState() {
    super.initState();

    Tamcha();
  }


  Future<void> Tamcha() async {
    final  response = await http.get(
      Uri.parse('https://flutter-chat-36135-default-rtdb.firebaseio.com/teachers2.json'),
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>?;
    if(extractedData == null)
    {
      return;
    }
    extractedData.forEach((infoId, infoData) {
      loadedOrders.add(InfoPupils(
        id: infoId,
        tutorial: infoData['tutorial'],
        name: infoData['name'],
        time:   infoData['time'],
        rate: infoData["rateOfStudent"],
        data: infoData["dateOfStudent"],
        names: infoData["nameOfStudent"],
      ));
    });
    setState(() {
      isLoading = false;
    });
    print(extractedData);
    print("getda kevotgan datala");
    print(response);
  }

  /*void active() {
    print('############################');
    print(widget.sinf.data);
    print('############################');
    widget.sinf.data.forEach((el12) {
      sana.add(TextEditingController(text: el12));
    });
    print(sana.length);
    widget.sinf.names.forEach((el123) {
      data.add(TextEditingController(text: el123));
    });
    widget.sinf.rate.forEach((element) {
      List<TextEditingController> temp23 = [];
      element.forEach((element1) {
        temp23.add(TextEditingController(text: element1));
      });
      rate.add(temp23);
    });
    name_controller = TextEditingController(text: InfoPupils.id);
    group_controller = TextEditingController(text: widget.sinf.tutorial);
    time_controller = TextEditingController(text: widget.sinf.time);
    setState(() {
      isLoading = false;
    });
  }*/
  List<TextEditingController> data = [];
  List<List<TextEditingController>> rate = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daomad',
          style: TextStyle(
              color: Colors.black
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: isLoading?Center(
        child: CircularProgressIndicator(),)
          :Container(
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

                          data.add(TextEditingController());
                          List<TextEditingController> temp = [];
                          for (int j = 0; j < 51; j++) {
                            temp.add(TextEditingController());
                          };
                          rate.add(temp);

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
                          List<List<String>> rateStrings = [];
                          List<String> sanaStrings = [];
                          sana.forEach((element) {
                            sanaStrings.add(element.text);
                          });
                          print(sanaStrings);
                          print(data);
                          data.forEach((element) {
                            dataStrings.add(element.text);
                          });
                          print(dataStrings);
                          rate.forEach((element) {
                            List<String> temp23 = [];
                            element.forEach((element1) {
                              temp23.add(element1.text);
                            });
                            rateStrings.add(temp23);
                          });
                          print(rate);

                          final  responce = await http.post(
                              Uri.parse('https://flutter-chat-36135-default-rtdb.firebaseio.com/teachers2.json'),
                              body: jsonEncode(
                                  {
                                    "name":name_controller.text,
                                    "time":time_controller.text,
                                    "tutorial":group_controller.text,
                                    "nameOfStudent": dataStrings,
                                    "dateOfStudent":sanaStrings,
                                    "rateOfStudent":rateStrings
                                  }
                              )
                          );
                          print(responce);
                          Navigator.pop(
                              context, MaterialPageRoute(builder: (_) => Kirish()));
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
                              itemCount: sana.length,
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
                                  controller: data[index],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width*70,
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 50,
                                    itemBuilder: (context,index2)=>Container(
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

                                          controller: rate[index][index2],
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
class InfoPupils{
  String id;
  String name;
  String tutorial;
  String time;
  List<dynamic> names;
  List<dynamic> data;
  List rate;
  InfoPupils(
      {
        required this.id,
        required this.names,
        required this.data,
        required this.rate,
        required this.name,
        required this.tutorial,
        required this.time
      });
}