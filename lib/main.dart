import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MyFirstScreen(),
      //   '/second': (context) => SecondScreen('second screen'),
      //   '/third': (context) => SecondScreen('third screen'),
      // },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final _fname = 'assets/documents/data.txt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('event app ', style: TextStyle(fontSize: 23.0)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const Text('Resource Access',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
            Padding(padding: EdgeInsets.all(10.0)),
            TextField(
              controller: _controller,
              style: TextStyle(fontSize: 24),
              minLines: 1,
              maxLines: 5
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.open_in_new),
        onPressed: () async{
          var value = await loadIt();
          setState(() {
            _controller.text = value;
          });
          showDialog(context: context, builder: (BuildContext buildContext)=>
              const AlertDialog(
                title: Text("load suceeced!"),
                content: Text("load message from asset"),
              )
          );
        },
      ),
    );
  }

  Future<File> getDataFile(String fileName) async{
    var directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  Future<String> getDataAsset(String path) async{
    return await rootBundle.loadString(path);
  }
  void saveIt(String value) async {
    var file = await getDataFile(_fname);
    file.writeAsString(value);
  }
  Future<String> loadIt() async{
    try{
       var res =await getDataAsset(_fname);
       debugPrint("data is $res");
       return res;
    }catch(e){
      print(e.toString());
      return 'no data';
    }
  }
}
