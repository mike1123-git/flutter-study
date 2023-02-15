import 'package:flutter/material.dart';

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
      home: const MyHomePageDrawer(),
    );
  }
}

class MyFirstScreen extends StatefulWidget {
  MyFirstScreen({Key? key}) : super(key: key);

  @override
  // State<StatefulWidget> createState() {
  //   return _MyFirstScreenState;
  // }
  MyFirstScreenState createState() {
    return MyFirstScreenState();
  }
}

class MyFirstScreenState extends State<MyFirstScreen> {
  final _controller = TextEditingController();
  var _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Column(children: [
        const Text('Home Screen', style: TextStyle(fontSize: 32.0)),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: _controller,
            style: const TextStyle(fontSize: 20.0),
            onChanged: changeField,
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.navigate_next), label: 'newt')
        ],
        onTap: (int value) {
          if (value == 1) {
            Navigator.pushNamed(context, '/second');
          }
        },
      ),
    );
  }

  void changeField(String value) {
    _input = value;
  }
}

class SecondScreen extends StatelessWidget {
  final String _value;

  SecondScreen(this._value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next'),
      ),
      body: Center(
          child: Text(
            'you typed $_value',
            style: const TextStyle(fontSize: 32.0),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.navigate_before), label: 'prev'),
          BottomNavigationBarItem(icon: Icon(Icons.android), label: '?')
        ],
        onTap: (int value) {
          if (value == 0) {
            Navigator.pop(context);
          }
          if (value == 1) {
            Navigator.pushNamed(context, '/third');
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _message = 'text input';
  var janken = <String>['goo', 'choki', 'per'];
  var _selected = 'one';
  var _value = 10.0;
  var _stars = '☆☆☆☆☆';
  var _star = 0;
  var _index = 0;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Name'),
          leading: const BackButton(
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: iconPressedA,
                tooltip: 'add star...',
                icon: const Icon(Icons.android)),
            IconButton(
                onPressed: iconPressedB,
                tooltip: 'subtract star',
                icon: const Icon(Icons.favorite))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Center(
              child: Text(_stars,
                  style: const TextStyle(fontSize: 22.0, color: Colors.black)),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                      color: Colors.blue,
                      height: 120.0,
                      child: const Center(
                          child: Text(
                              'One', style: TextStyle(fontSize: 23.0)))),
                  Container(
                      color: Colors.white,
                      height: 120.0,
                      child: const Center(
                          child: Text(
                            'Two',
                            style: TextStyle(fontSize: 23.0),
                          ))),
                  Container(
                      color: Colors.blue,
                      height: 120.0,
                      child: const Center(
                          child: Text(
                              'three', style: TextStyle(fontSize: 23.0)))),
                  Container(
                      color: Colors.white,
                      height: 120.0,
                      child: const Center(
                          child: Text(
                              'four', style: TextStyle(fontSize: 23.0)))),
                  Container(
                      color: Colors.blue,
                      height: 120.0,
                      child: const Center(
                          child: Text(
                              'five', style: TextStyle(fontSize: 23.0))))
                ])));
    bottomNavigationBar:
    BottomNavigationBar(
      currentIndex: _index,
      backgroundColor: Colors.lightBlueAccent,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            label: 'android',
            icon: Icon(Icons.android, color: Colors.black, size: 50)),
        BottomNavigationBarItem(
            label: 'favorite',
            icon: Icon(Icons.favorite, color: Colors.red, size: 50)),
        BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home, color: Colors.white, size: 50))
      ],
      onTap: tapButtonIcon,
    );
  }

  void b_onPressed() =>
      setState(() {
        _message = 'you said ${_controller.text}';
      });

  void textChanged(String val) {
    setState(() {
      _message = val.toUpperCase();
    });
  }

  void popupSelected(String? val) {
    setState(() {
      _selected = val ?? 'not selected';
      _message = 'selected: $_selected';
    });
  }

  void sliderChanged(double value) {
    setState(() {
      _value = value.floorToDouble();
      _message = 'set value $_value';
    });
  }

  void buttonPressed() {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: const Text("hello!!!"),
              content: const Text("This is Sample"),
              actions: <Widget>[
                TextButton(
                    onPressed: () => Navigator.pop<String>(context, 'Cancel'),
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () => Navigator.pop<String>(context, 'OK'),
                    child: const Text('OK'))
              ],
            )).then<void>((value) => resultAlert(value));
  }

  void buttonPressed_sd() {
    showDialog(
        context: context,
        builder: (BuildContext buildContext) =>
            SimpleDialog(
              title: const Text('Select Assignment'),
              children: <Widget>[
                SimpleDialogOption(
                    onPressed: () => Navigator.pop<String>(context, 'One'),
                    child: const Text('one')),
                SimpleDialogOption(
                    onPressed: () => Navigator.pop<String>(context, 'Two'),
                    child: const Text('two')),
                SimpleDialogOption(
                    onPressed: () => Navigator.pop<String>(context, 'three'),
                    child: const Text('three'))
              ],
            )).then((value) => resultAlert(value));
  }

  void resultAlert(value) {
    setState(() {
      _message = 'selected is $value';
    });
  }

  void iconPressedA() {
    _message = 'tap "andoroid".';
    _star++;
    update();
  }

  void iconPressedB() {
    _message = 'tap "favorite".';
    _star--;
    update();
  }

  void update() {
    _star = _star < 0
        ? 0
        : _star > 5
        ? 5
        : _star;
    setState(() {
      _stars = '☆☆☆☆☆★★★★★'.substring(5 - _star, 5 - _star + 5);
      _message = '$_message[$_star]';
    });
  }

  void tapButtonIcon(int value) {
    var items = ['Android', 'Heart', 'Home'];
    setState(() {
      _index = value;
      _message = 'you taped${items[_index]}.';
    });
  }

  void tapTitle() {
    setState(() {
      _message = 'you tapeed : No. $_index';
    });
  }
}

class MyHomePageViewTab extends StatefulWidget {

  @override
  MyHomePageViewTabState createState() => MyHomePageViewTabState();
}

class MyHomePageViewTabState extends State<MyHomePageViewTab>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'One'),
    Tab(text: 'Two'),
    Tab(text: 'Three')
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: tabs.length,
        vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: tabs.map((Tab tab) {
          return createTab(tab);
        }).toList(),
      ),
    );
  }

  Widget createTab(Tab tab) {
    return Center(
      child: Text(
        'This is ${tab.text} Tab. ',
        style: const TextStyle(
            fontSize: 30.0,
            color: Colors.blue

        ),
      ),
    );
  }
}

class MyHomePageDrawer extends StatefulWidget {
  const MyHomePageDrawer({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyHomePageDrawerState();
  }

}

class MyHomePageDrawerState extends State<MyHomePageDrawer> {

  final _items = <Widget>[];
  var _message = 'ok';
  var _tapped = 0;

  @override
  initState() {
    super.initState();
    for (var i = 0; i < 5; i++) {
      var item = ListTile(
        leading: const Icon(Icons.android),
        title: Text('Np.$i'),
        onTap: () {
          _tapped = i;
          tapItem();
        },
      );
      _items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter app'),
      ),
      body: Center(
          child: Text(
              _message,
              style: const TextStyle(fontSize: 20.0)
          )
      ),
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: _items,
        ),
      ),
    );
  }

  void tapItem() {
    Navigator.pop(context);
    setState(() {
      _message = 'tapped $_tapped';
    });
  }
}




