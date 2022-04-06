import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("hello world"),
        ),
        body: const BodyOfScaffold(),
      ),
    );
  }
}

class BodyOfScaffold extends StatefulWidget {
  const BodyOfScaffold({Key? key}) : super(key: key);

  @override
  State<BodyOfScaffold> createState() => _BodyOfScaffoldState();
}

class _BodyOfScaffoldState extends State<BodyOfScaffold> {
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  String message = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("hello"),
          TextField(
            controller: a,
          ),
          TextField(
            controller: b,
          ),
          ElevatedButton(
              onPressed: () {
                passDataToDB();
              },
              child: const Text("Add two number 3")),
          // Text(data),
        ],
      ),
    );
  }

  Future passDataToDB() async {
    debugPrint("entered in function ");
    var mapData = {"firstValue": a.text, "secondValue": b.text};
    final response = await http.post(
        Uri.parse(
            'https://sanamtamang.com.np/backend_practice/fluttertophp.php'),
        body: mapData);

    if (response.statusCode == 200) {
      debugPrint("Success");
      debugPrint(response.body);
      //data is String
      var data = jsonDecode(response.body);
      debugPrint(data.runtimeType.toString());

//dataAgain is map

      //print the data of message and hi respectively
      debugPrint(data['message'].toString());
      debugPrint(data['hi'].toString());
    } else {
      debugPrint("going in defferent statusCode");
    }
  }
}
