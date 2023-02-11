import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = 'Flutterサンプル';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Data {
  final int _price;
  final String _name;

  Data(this._price, this._name) : super();

  @override
  String toString() {
    return '$_name;$_price';
    // return _name+ ';' + _price.toString();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  static final _data = [
    Data(200, 'Apple'),
    Data(100, 'Orange'),
    Data(400, 'Peach')
  ];

  Data _item = _data[0];

  void _setData() {
    setState(() {
      _item = (_data..shuffle()).first;
    });
  }
  int _count=0;
  void _addCount(){
   setState((){
     _count++;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
        '$_count',
        style: const TextStyle(fontSize: 32.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCount,
        tooltip: 'add count.',
        child: const Icon(Icons.add),
      ),
    );
  }
}
