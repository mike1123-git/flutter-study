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

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // late Animation<double> animation;
  // late AnimationController animationController;
  bool flg = false;

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
          AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: flg? 24.0:48.0,
                fontWeight: FontWeight.bold,
                color: flg ? Colors.red : Colors.blue,

              ),
              duration: const Duration(seconds: 3),
              child: const Text('hello flutter'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          flg = !flg;
        }),
        child: const Icon(Icons.star),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  double value;

  MyPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    canvas.save();

    p.style = PaintingStyle.fill;
    p.color = const Color.fromARGB(100, 255, 0, 255);

    Rect r = Rect.fromLTWH(0, 0, 250, 250);
    canvas.translate(150, 250);
    canvas.rotate(value);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);

    canvas.restore();

    p.style = PaintingStyle.stroke;
    p.strokeWidth = 25;
    p.color = const Color.fromARGB(100, 255, 0, 255);
    p.color = const Color.fromARGB(100, 0, 255, 255);

    r = Rect.fromLTWH(0, 0, 250, 250);
    canvas.rotate(value);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
