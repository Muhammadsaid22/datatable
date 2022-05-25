import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat/screnns/teachers/active_teachers.dart';
import 'package:flutter_chat/screnns/teachers/teachers.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart'as http;
class OqituvchiQowiw extends StatefulWidget {
  const OqituvchiQowiw({Key? key}) : super(key: key);

  @override
  _OqituvchiQowiwState createState() => _OqituvchiQowiwState();
}

class _OqituvchiQowiwState extends State<OqituvchiQowiw> {
  final List<InfoTeachers> loadedOrdersTeachers= [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tamcha();

  }

  void Tamcha() async {
    final  response = await http.get(
      Uri.parse('https://flutter-chat-36135-default-rtdb.firebaseio.com/teachers2.json'),
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>?;
    if(extractedData == null)
    {
      return;
    }
    extractedData.forEach((infoId, infoData) {
      loadedOrdersTeachers.add(InfoTeachers(
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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.yellow,
          actions: [
            IconButton(
                onPressed: ()
                async {

                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Teachers())
                  );
                },
                icon: Icon(Icons.add,
                    size: 32,
                    color: Colors.white
                )
            )
          ],
        ),
        body: isLoading?Center(child: CircularProgressIndicator(),):Container(
          height: double.infinity,
          child: ListView.builder(
              itemCount: loadedOrdersTeachers.length,
              itemBuilder: (context,index) =>InkWell(
                onTap: (){

                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ActiveTeachers(
                      loadedOrdersTeachers[index],
                      Tamcha
                  ))
                  );

                },
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'O\'chirish',
                        onPressed: (BuildContext context) async {
                          final  response = await http.delete(
                            Uri.parse('https://flutter-chat-36135-default-rtdb.firebaseio.com/teachers2/${loadedOrdersTeachers[index].id}.json'),
                          );
                          setState(() {
                            isLoading = true;
                            loadedOrdersTeachers.length;
                          });
                          Tamcha();
                        },
                      ),
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(6),
                    height: 70,
                    width: MediaQuery.of(context).size.width*85,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.blueAccent
                        ),
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: ListTile(
                      title: Text(loadedOrdersTeachers[index].tutorial,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      subtitle: Text(loadedOrdersTeachers[index].name,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),),
                      trailing: Text(loadedOrdersTeachers[index].time,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                ),
              )
          ),
        )
    );
  }
}
class InfoTeachers{
  String id;
  String name;
  String tutorial;
  String time;
  List<dynamic> names;
  List<dynamic> data;
  List rate;
  InfoTeachers(
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
