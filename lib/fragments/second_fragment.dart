import 'package:firstapp/mainpage/main.dart';
import 'package:firstapp/others/panel.dart';
import 'package:firstapp/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
        child: My_App(),
//      child: new Text("Hello Fragment 2"),
//      child: new MyApp(),
    );
  }

}

class My_App extends StatefulWidget {
  // StatefulWidget
  @override
  _State createState() => _State();
}


class _State extends State<My_App> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SlidingUpPanelExample"),
      ),
      body: SlidingUpPanel(
        panel: Center(
          child: Text("This is the sliding Widget"),
            /*child: Column(
                children: <Widget>[
                  Padding(
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
//          Container(                      // Using -> Container/SizedBox/FractionallySizedBox
//              width: 300, // or whatever width you want,
//              child: CupertinoButton(
//          child: Text('Login'),
//          color: Theme.of(context).primaryColor,
//          onPressed: () {
//            // Write your callback here
//          },
//        ),
//    ),

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
                                      'Sign out',
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
                      ))])*/
        ),
        body: Center(
          child: Text("This is the Widget behind the sliding panel"),
        ),
      ),
    );
  }
}