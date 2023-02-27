import 'dart:math';

import 'package:flutter/material.dart';
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
  final _fname = 'flutter_sampledata.txt';

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
            const Text('File Access',
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.save,color: Colors.white,size: 32),
          label: 'Save'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.open_in_new,color: Colors.white,size:32),
            label: 'Load'
          )
        ],
        onTap: (int value) async{
          switch(value){
            case 0:
              saveIt(_controller.text);
              // setState(() {
              //   _controller.text='';
              // });
              showDialog(context: context,
                  builder:(BuildContext context) => const AlertDialog(
                    title: Text('Saved'),
                    content: Text('save message to file'),
                  )
              );
              break;
            case 1:
              String value = await loadIt();
              setState(() {
                _controller.text=value;
              });
              showDialog(context: context,
                  builder:(BuildContext context) =>  AlertDialog(
                    title: Text('Loaded'),
                    content: Text('load message to file'),
                  )
              );
              break;
            default:print('no default');
          }
        },
      ),
    );
  }

  Future<File> getDataFile(String fileName) async{
    var directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  void saveIt(String value) async {
    var file = await getDataFile(_fname);
    file.writeAsString(value);
  }
  Future<String> loadIt() async{
    try{
      var file = await getDataFile(_fname);
      return file.readAsString();
    }catch(e){
      return 'no data';
    }
  }
}
