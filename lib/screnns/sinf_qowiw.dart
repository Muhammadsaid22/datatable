import 'dart:convert';

import 'package:flutter/material.dart';
import 'oquvchilar.dart';
import 'package:http/http.dart'as http;
class SinfQowiw extends StatefulWidget {
  const SinfQowiw({Key? key}) : super(key: key);

  @override
  _SinfQowiwState createState() => _SinfQowiwState();
}

class _SinfQowiwState extends State<SinfQowiw> {
  final List<InfoPupils> loadedOrders = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tamcha();

  }

  Future<void> Tamcha() async {
    final  response = await http.get(
      Uri.parse('https://flutter-chat-36135-default-rtdb.firebaseio.com/pupils.json'),
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
      ));
    });
    setState(() {
      isLoading = false;
    });
    print(extractedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: ()
                async {

                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Oquvchilar())
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
              itemCount: loadedOrders.length,
              itemBuilder: (context,index) =>Container(
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
                  title: Text(loadedOrders[index].tutorial,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  subtitle: Text(loadedOrders[index].name,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),),
                  trailing: Text(loadedOrders[index].time,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                ),
              )
          ),
        )
    );
  }
}
class InfoPupils{
  String id;
  String name;
  String tutorial;
  String time;
  InfoPupils(
      {
        required this.id,
        required this.name,
        required this.tutorial,
        required this.time
      });
}
