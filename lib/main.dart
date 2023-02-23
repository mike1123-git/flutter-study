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
  double _value = 0;
  double _opaq = 0;

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
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Container(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: MyPainter(_value, _opaq.toInt()),
              child: Center(),
            ),
          ),
          Slider(min: 0.0, max: 300.0, value: _value, onChanged: _changeVal),
          Slider(min: 0.0, max: 255.0, value: _opaq, onChanged: _changeOpaq),
        ],
      ),
    );
  }

  void _changeVal(double value) {
    setState(() {
      _value = value;
    });
  }

  void _changeOpaq(double opaq) {
    setState(() {
      _opaq = opaq;
    });
  }
}

class MyPainter extends CustomPainter {
  double _value = 0;
  int _opaq = 0;

  MyPainter(this._value, this._opaq);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(_opaq, 0, 200, 100);

    Rect r = Rect.fromLTWH(
        (size.width - _value) / 2, (size.height - _value) / 2, _value, _value);
    canvas.drawOval(r, p);
    r = Rect.fromLTWH(0,0,size.width,size.height);
    p.style = PaintingStyle.stroke;
    p.color = const Color.fromARGB(255, 100, 100, 100);
    canvas.drawOval(r, p);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
