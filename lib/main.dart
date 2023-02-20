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

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});

  @override
    MyHomePageState  createState() => MyHomePageState();

}

class MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'paint app ',
          style: TextStyle(fontSize: 23.0)
        ),
      ),
      body: Container(
        child: CustomPaint(
          painter: MyPainter()
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Rect r = const Rect.fromLTWH(50.0, 50.0, 75.0, 75.0);
    path.addOval(r);
    r = const Rect.fromLTWH(75.0, 75.0, 125.0, 125.0);
    path.addOval(r);
    r = const Rect.fromLTWH(125.0, 125.0, 175.0, 175.0);
    path.addOval(r);
    canvas.save();

    Paint paint = Paint();
    paint.color= const Color.fromARGB(150, 255, 0, 0);
    paint.style=PaintingStyle.fill;
    canvas.drawPath(path, paint);

    canvas.translate(0.0, 100.0);
    paint.color=const Color.fromARGB(150, 0, 0, 255);
    canvas.drawPath(path, paint);

    paint.color=const Color.fromARGB(150, 0, 255, 0);
    canvas.rotate(-0.5 * pi);
    canvas.translate(-500.0, 50.0);
    canvas.scale(1 * 1.5);
    canvas.drawPath(path, paint);

    canvas.restore();

 }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

