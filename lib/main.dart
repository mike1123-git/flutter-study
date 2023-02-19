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
    Paint p = Paint();
    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textDirection: TextDirection.ltr)
    )..pushStyle(ui.TextStyle(color: Colors.red))
    ..addText('hello')
    ..pushStyle(ui.TextStyle(color: Colors.blue[700],fontSize:30.0))
    ..addText('This is a sample of paragraph text')
    ..pushStyle(ui.TextStyle(color: Colors.blue[200],fontSize: 30.0))
    ..addText('you can draw Multi-Font text!!')
    ;

    ui.Paragraph paragraph = builder.build()
    ..layout(const ui.ParagraphConstraints(width: 300.0));

    Offset offset =const Offset(50.0, 50.0);
    canvas.drawParagraph(paragraph, offset);
 }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

