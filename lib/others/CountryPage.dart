// ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CountryItem.dart';

class CountryPage extends StatefulWidget {
//  String title;

//  CountryPage({Key key, this.title}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<CountryPage> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  int selectIndex = -1;

  final europeanCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'Ireland',
    'Italy',
    'Kazakhstan',
    'Kosovo',
    'Latvia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Malta',
    'Moldova',
    'Monaco',
    'Montenegro',
    'Netherlands',
    'Norway',
    'Poland',
    'Portugal',
    'Romania',
    'Russia',
    'San Marino',
    'Serbia',
    'Slovakia',
    'Slovenia',
    'Spain',
    'Sweden',
    'Switzerland',
    'Turkey',
    'Ukraine',
    'United Kingdom',
    'Vatican City'
  ];

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
    CurvedAnimation _curvedAnimation =
    CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);
    _animation = new Tween(begin: 0.0, end: 1.1).animate(_curvedAnimation);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title;
    return Scaffold(
//        appBar: AppBar(
//            title: Text("Flutter Tutorial"),
//            brightness: Brightness.light,
//            elevation: 0.0,
//            backgroundColor: Colors.blue),

        body: ListView.builder(
          itemCount: europeanCountries.length,
          itemBuilder: (context, index) {
            return CountryItem(
              index: index,
              selectIndex: this.selectIndex,
              name: europeanCountries[index],
              animation: _animation,
              onTapMenu: () {
                _controller.forward(from: 0.0);
                setState(() {
                  selectIndex = index;
                });
              },
              onTapMenuClose: () {
                _controller.reverse(from: 1.1);
              },
              onTapEdit: () {},
              onTapOperation: () {},
              onTapDelete: () {
                _controller.reverse(from: 1.1);
              },
            );
          },
        ));
  }
}
