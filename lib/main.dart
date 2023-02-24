import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
  ValueNotifier<int> _value = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('event app ', style: TextStyle(fontSize: 23.0)),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Container(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: MyPainter(_value),
              child: Center(),
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          ElevatedButton(
              onPressed: () => _value.value++,
              child: const Text(
                'click',
                style: TextStyle(fontSize: 32),
              ))
        ],
      )),
    );
  }
}

class MyPainter extends CustomPainter {
  ValueNotifier<int> _value;

  MyPainter(this._value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = const Color.fromARGB(50, 0, 200, 100);

    Rect r;
    for(var i = 0;i < _value.value;i++){
      r = Rect.fromLTWH(10+i*20,10+i*20 , 100, 100);
      canvas.drawRect(r, p);
    }
    r = Rect.fromLTWH(0, 0, size.width, size.height);
    p.style = PaintingStyle.stroke;
    p.color = const Color.fromARGB(255, 100, 100, 100);
    canvas.drawRect(r, p);
    if(_value.value > 10) _value.value =0;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
