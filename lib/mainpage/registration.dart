import 'dart:async';

import 'package:firstapp/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Registration extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool checkValue = false;

  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text('Registration'),
//        ),
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
                Image.network(
                  'https://placeimg.com/640/480/any',
                  height: 90.0,
                  width: 90.0,
                  alignment: FractionalOffset.center,
//                                                fit: BoxFit.fill,
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign Up',
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
//                  child: Text('Forgot Password'),
                ),
                new CheckboxListTile(
                  value: checkValue,
                  onChanged: _onChanged,
                  title: new Text("Remember me"),
                  controlAffinity: ListTileControlAffinity.leading,
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
                      child: Text('Sign Up', style: TextStyle(fontSize: 15)),
                      onPressed: () {
                        if (nameController.text.length == 0) {
                          Fluttertoast.showToast(
                              msg: "Please enter Email-Id",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else if (passwordController.text.length == 0) {
                          Fluttertoast.showToast(
                              msg: "Please enter password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
//                          addStringToSF(nameController.text, passwordController.text);
                          print(nameController.text);
                          print(passwordController.text);
                          // ignore: unnecessary_statements
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage()));
                        }
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('You have an account?'),
                    FlatButton(
                      textColor: Colors.blue,
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        sharedPreferences =
                            await SharedPreferences.getInstance();

                        sharedPreferences.setBool("check", checkValue);
                        sharedPreferences.setString(
                            "email", nameController.text);
                        sharedPreferences.setString(
                            "password", passwordController.text);
                        // ignore: deprecated_member_use
                        sharedPreferences.commit();
                        //signup screen
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => Login()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }

  _onChanged(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value;
      sharedPreferences.setBool("check", checkValue);
      sharedPreferences.setString("email", nameController.text);
      sharedPreferences.setString("password", passwordController.text);
      // ignore: deprecated_member_use
      sharedPreferences.commit();
      getCredential();
    });
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          nameController.text = sharedPreferences.getString("email");
          passwordController.text = sharedPreferences.getString("password");
        } else {
          nameController.clear();
          passwordController.clear();
          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }
}

addStringToSF(String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('Email', email);
  prefs.setString('Password', password);
}
