import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_20/json/json.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map weather = {};
  String city = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.cloud),
        title: Text(
          'Open Whether Map',
          style: TextStyle(fontSize: 24.0),
          textAlign: TextAlign.end,
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: weather.isNotEmpty
                ? [
                    CircleAvatar(
                      child: Image.network(
                          'https://openweathermap.org/img/wn/${weather['status']}@2x.png'),
                    ),
                    Text(
                      weather['temp'].toString(),
                      style: TextStyle(
                        fontSize: 32.0,
                      ),
                    ),
                  ]
                : [],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Выбор города'),
                  content: TextField(
                    decoration: InputDecoration(hintText: "Название города"),
                    maxLength: 32,
                    onChanged: (String value) {
                      city = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          Map temp = await getData(city);
                          setState(() {
                            weather = temp;
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text('ok'))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}


// weather.isNotEmpty
//             ? [
//                 CircleAvatar(
//                   child: Image.network(
//                       'https://openweathermap.org/img/wn/${weather['status']}@2x.png'),
//                 ),
//                 Text(weather['temp'].toString()),
//               ]
//             : [],

// floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.black12,
//           child: Icon(Icons.deck),
//           onPressed: () async {
//             Map temp = await getData(city);
//             setState(() {
//               weather = temp;
//             });
//           },
//         )
// TextField(
//               onChanged: (String value) {
//                 setState(() {
//                   city = value;
//                 });
//               },