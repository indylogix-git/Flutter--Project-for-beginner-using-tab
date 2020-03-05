import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'CountryPage.dart';

void main() => runApp(MyApp());

//void main() {
//  runApp(MaterialApp(
//    home: My_App(),
//  ));
//}

class My_App extends StatefulWidget {
  // StatefulWidget
  @override
  _State createState() => _State();
}

class MyApp extends StatelessWidget {
  // StatefulWidget
  @override
//  _State createState() => _State();

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashScreen(),
    );
  }

//  _MyAppState createState() => _MyAppState();
}

class _State extends State<My_App> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sample App'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'TutorialKart',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MySecondPage extends StatefulWidget {
  @override
  _MySecondPageState createState() => _MySecondPageState();
}

class MyThirdPage extends StatefulWidget {
  @override
  _MyThirdPageState createState() => _MyThirdPageState();
}

/*Fragment Start*/

const List<String> tabNames = const <String>[
  'foo',
  'bar',
  'baz',
  'quox',
  'quuz',
  'corge',
  'grault',
  'garply',
  'waldo'
];

class _MyHomePageState extends State<MyHomePage> {
  int _screen = 0;
  int _count = 0;
  List data;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabNames.length,
        child: new Scaffold(
          appBar: AppBar(
            title: Text('Home - TutorialKart'),
          ),
          body: new TabBarView(
            // ignore: missing_return
            children: new List<Widget>.generate(tabNames.length, (int index) {
              switch (_screen) {
                case 0:
                  return new Center(
                    child: CountryPage(), // title: tabNames[index]
//                        child: new Text('First screen, ${tabNames[index]}, $_count'),
                  );
                case 1:
                  return new Center(
                      child: new SingleChildScrollView(
                          child: new ConstrainedBox(
                              constraints: new BoxConstraints(),
                              child: Column(children: <Widget>[
                                Center(
//                    child: new Text('Second screen'),
                                    child: Center(
                                        child: Column(children: <Widget>[
                                  Center(
                                    child: RaisedButton(
                                      child: Text('Go to Second Screen'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MySecondPage()),
                                        );
                                      },
                                      textColor: Colors.white,
                                      color: Colors.lightGreen,
                                    ),
                                  ),
                                  RaisedButton(child: Text('Disabled Button')),
                                  RaisedButton(
                                    child: Text('Default Enabled'),
                                    onPressed: () {
                                      print('IconButton is pressed');
                                    },
                                  ),
                                  RaisedButton(
                                    child: Text('Text Color Changed'),
                                    textColor: Colors.red,
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('Color Changed'),
                                    color: Colors.green,
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('Button with Padding'),
                                    padding: EdgeInsets.all(20),
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('More Rounded Corners'),
                                    color: Colors.purpleAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.0))),
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('Elevation increased'),
                                    elevation: 5,
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('Splash Color as red'),
                                    splashColor: Colors.red,
                                    onPressed: () {},
                                  ),
                                  RaisedButton(
                                    child: Text('Zero Elevation'),
                                    elevation: 0,
                                    onPressed: () {
                                      _showScaffold(
                                          "This is a SnackBar called from another place.");
                                    },
                                  ),
                                  RaisedButton(
                                    onPressed: () {},
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(0.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            Color(0xFF0D47A1),
                                            Color(0xFF1976D2),
                                            Color(0xFF42A5F5),
                                          ],
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      child: const Text('Gradient Color'),
                                    ),
                                  ),
                                ])))
                              ]))));
                case 2:
//                  return new Center(
                  return new Scaffold(
//                    appBar: new AppBar(
//                        title: new Text(
//                          "Listviews",
//                          textAlign: TextAlign.justify,
//                        ),
//                        backgroundColor: Colors.purple),
                    body: new ListView.builder(
                      itemCount: data == null ? 0 : data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var post = data[index];
                        return new Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            child: Container(
                                child: Column(children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
//                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 12.0, 0, 6.0),
                                        child: Text(
                                          data[index]["title"],
                                          maxLines: 2,
//                                          sendersList[position],
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 12.0, 0, 6.0),
                                        child: Text(
                                          data[index]["body"],
//                                          subjectList[position],
                                          style: TextStyle(fontSize: 11.0),
                                          maxLines: 5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
//                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          "5m",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.star_border,
                                            size: 35.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 2.0,
                                color: Colors.grey,
                              )
                            ])));

//                            semanticContainer: true,
//                            clipBehavior: Clip.antiAliasWithSaveLayer,
//                            shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(10.0),
//                            ),
//                            elevation: 5,
//                            margin:
//                                EdgeInsets.only(left: 10, right: 10, top: 10),
//                            child: Container(
//                                height: 160,
//                                child: Stack(children: <Widget>[
//                                  Positioned(
//                                      top: 40,
//                                      left: 0,
//                                      right: 0,
//                                      bottom: 10,
//                                      child: Container(
//                                          color: Colors.white,
//                                          child: Column(
//                                            children: <Widget>[
//                                              Image.network(
//                                                'https://placeimg.com/640/480/any',
//                                                height: 90.0,
//                                                width: 90.0,
//                                                alignment:
//                                                    FractionalOffset.centerLeft,
////                                                fit: BoxFit.fill,
//                                              ),
////                                              child: new Text(data[index]["title"],),
////                                              shape: RoundedRectangleBorder(
////                                                borderRadius: BorderRadius.circular(12.0),
////                                              ),
////                                              elevation: 8,
//////                          margin: EdgeInsets.all(10),
////                                              margin: EdgeInsets.only(left: 10, right: 10, top: 12),
//                                            ],
//                                          ))),
//                                  new Text(data[index]["title"], textAlign: TextAlign.center, maxLines: 2, style: TextStyle(height: 3, fontSize: 12),),
////                                  new Text(data[index]["body"],),
//                                ])));
                      },
                    ),
//                    child: new Text('Third screen'),
                  );
              }
            }),
          ),
//          bottomNavigationBar: BottomAppBar(
//            shape: const CircularNotchedRectangle(),
//            child: Container(height: 50.0,),
//          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => launch("tel://9829194215"),
            child: new Icon(Icons.add_call),
//              child: new Text("Call me")

//            onPressed: () => setState(() => _count++),
//            tooltip: 'Increment Counter',
//            child: const Icon(Icons.add),
          ),
//          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              new AnimatedCrossFade(
                firstChild: new Material(
                  color: Theme.of(context).primaryColor,
                  child: new TabBar(
                    isScrollable: true,
                    tabs: new List.generate(tabNames.length, (index) {
                      return new Tab(text: tabNames[index].toUpperCase());
                    }),
                  ),
                ),
                secondChild: new Container(),
                crossFadeState: _screen == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
              ),
              new BottomNavigationBar(
                currentIndex: _screen,
                onTap: (int index) {
                  setState(() {
                    _screen = index;
                  });
                },
                items: [
                  new BottomNavigationBarItem(
                    icon: new Icon(Icons.account_balance),
                    title: new Text('Dashboard'),
                  ),
                  new BottomNavigationBarItem(
                    icon: new Icon(Icons.add_to_home_screen),
                    title: new Text('Home'),
                  ),
                  new BottomNavigationBarItem(
                    icon: new Icon(Icons.add_alert),
                    title: new Text('Notification'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class _MySecondPageState extends State<MySecondPage> {
  List<bool> _selections = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Screen'),
        ),
        body: Center(
            child: new SingleChildScrollView(
                child: new ConstrainedBox(
          constraints: new BoxConstraints(),
          child: Column(children: <Widget>[
            Center(
              child: RaisedButton(
                child: Text('Go back to Home Screen'),
                onPressed: () {
                  Navigator.pop(context);
                },
                textColor: Colors.white,
                color: Colors.lightGreen,
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text('Go to Third Screen'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyThirdPage()),
                  );
                },
                textColor: Colors.white,
                color: Colors.lightGreen,
              ),
            ),
            Center(
                child: Icon(
              Icons.directions_transit,
              color: Colors.red,
            )),
            Center(
                child: Icon(
              Icons.directions_transit,
              color: Colors.green,
              size: 70,
            )),
            Text('Trains',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Futura',
                  color: Colors.deepOrange,
                )),
            Center(
                child: Text(
              'Students',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
            DataTable(
              columns: [
                DataColumn(label: Text('RollNo')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Class')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Arya')),
                  DataCell(Text('6')),
                ]),
                DataRow(cells: [
                  DataCell(Text('12')),
                  DataCell(Text('John')),
                  DataCell(Text('9')),
                ]),
                DataRow(cells: [
                  DataCell(Text('42')),
                  DataCell(Text('Tony')),
                  DataCell(Text('8')),
                ]),
              ],
            ),
            Text(
              'Raised Buttons with Different Properties',
              style: TextStyle(fontSize: 16),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                child: ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.add_comment),
                    Icon(Icons.airline_seat_individual_suite),
                    Icon(Icons.add_location),
                  ],
                  isSelected: _selections,
                  onPressed: (int index) {
                    setState(() {
                      _selections[index] = !_selections[index];
                    });
                  },
                )),
          ]),
        ))));
  }
}

class _MyThirdPageState extends State<MyThirdPage> {
  bool isSwitched = false;
  TextEditingController nameController = TextEditingController();
  String fullName = '';
  double iconSize = 40;

  double _fontSize = 20;

  void increaseFontSize() {
    setState(() {
      _fontSize = 30;
    });
  }

  double opacityLevel = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Third Screen'),
        ),
        body: Center(
          child: new SingleChildScrollView(
              child: new ConstrainedBox(
            constraints: new BoxConstraints(),
            child: Column(children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text('Go back to Second Screen'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              MaterialButton(
                child: Text(
                  'Show details',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                onPressed: () => setState(() {
                  opacityLevel = 1.0;
                }),
              ),
              AnimatedOpacity(
                duration: Duration(seconds: 3),
                opacity: opacityLevel,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Name: Bhanu Prakash Dave',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Age: 35',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Occupation: Android Developer',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Image.network('https://urlzs.com/RsqCz'),
              /*Download Image From URL*/
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    'Hello! Welcome to TutorialKart. We shall zoom this text when you long press on it.',
                    style: TextStyle(fontSize: _fontSize),
                    textAlign: TextAlign.center,
                  )),
              RaisedButton(
                onPressed: () => {increaseFontSize()},
                child: Text('Bigger Font'),
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    print(isSwitched);
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                    ),
                    onChanged: (text) {
                      setState(() {
                        fullName = text;
                        //you can access nameController in its scope to get
                        // the value of text entered as shown below
                        //fullName = nameController.text;
                      });
                    },
                  )),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(fullName),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 10),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      Column(children: [
                        Icon(
                          Icons.account_box,
                          size: iconSize,
                          color: Colors.deepPurple,
                        ),
                        Text('My Account')
                      ]),
                      Column(children: [
                        Icon(
                          Icons.settings,
                          size: iconSize,
                          color: Colors.purple,
                        ),
                        Text('Settings')
                      ]),
                      Column(children: [
                        Icon(
                          Icons.lightbulb_outline,
                          size: iconSize,
                          color: Colors.amber,
                        ),
                        Text('Ideas')
                      ]),
                    ]),
                    TableRow(children: [
                      Icon(
                        Icons.cake,
                        size: iconSize,
                        color: Colors.amberAccent,
                      ),
                      Icon(
                        Icons.voice_chat,
                        size: iconSize,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.add_location,
                        size: iconSize,
                        color: Colors.brown,
                      ),
                    ]),
                  ],
                ),
              ),
            ]),
          )),
        ));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text(
          'Sample App',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
//        child: Image.asset('asse/**/ts/splash.png'),
      ),
    );
  }
}
/*Fragment End*/

/*Product Box Example*/
class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("assets/appimages/" + image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price: " + this.price.toString()),
                        ],
                      )))
            ])));
  }
}
