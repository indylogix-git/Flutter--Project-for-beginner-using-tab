import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryItem extends StatelessWidget {
  const CountryItem(
      {Key key,
        @required this.name,
        @required this.index,
        @required this.selectIndex,
        @required this.onTapMenu,
        @required this.onTapEdit,
        @required this.onTapOperation,
        @required this.onTapDelete,
        @required this.onTapMenuClose,
        @required this.animation})
      : super(key: key);

  final String name;
  final int index;
  final int selectIndex;
  final Function onTapMenu;
  final Function onTapEdit;
  final Function onTapOperation;
  final Function onTapDelete;
  final Function onTapMenuClose;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(context,
                      color: Colors.orange, width: 0.8),
                )),
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          maxLines: 1,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Container(
                              child: const Text(
                                "Country Description",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Offstage(
                          offstage: index % 3 != 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "Flutter tutorial provide daily new post.",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                            height: 24.0,
                            padding:
                            EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Text('Click', style:TextStyle(color: Colors.blue))),
                        onTap: onTapMenu,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Flutter Tutorial", style:TextStyle(color: Colors.grey.withOpacity(0.8)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Offstage(
            offstage: selectIndex != index,
            child: AnimatedBuilder(
                animation: animation,
                builder: (_, child) {
                  return MenuReveal(
                    revealPercent: animation.value,
                    child: InkWell(
                      onTap: onTapMenuClose,
                      child: Container(
                        color: Colors.blue.withOpacity(0.1), //Color(0x4D000000),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            buttonTheme: ButtonThemeData(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12.0),
                              minWidth: 70.0,
                              height: 35.0,
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap, // 距顶部距离为0
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            textTheme: const TextTheme(button: TextStyle()),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                color: Colors.white,
                                child: const Text("Edit"),
                                onPressed: onTapOperation,
                              ),
                              FlatButton(
                                color: Colors.white,
                                child: const Text("Update"),
                                onPressed: onTapOperation,
                              ),
                              FlatButton(
                                color: Colors.white,
                                child: const Text("Delete"),
                                onPressed: onTapDelete,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}

class MenuReveal extends StatelessWidget {
  final double revealPercent;
  final Widget child;

  MenuReveal({this.revealPercent, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: new CircleRevealClipper(revealPercent),
      child: child,
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {
  final double revealPercent;
  CircleRevealClipper(this.revealPercent);

  @override
  Rect getClip(Size size) {
    final epicenter = new Offset(size.width - 25.0, 25.0);

    double theta = atan(epicenter.dy / epicenter.dx);
    final distanceToCorner = (epicenter.dy) / sin(theta);

    final radius = distanceToCorner * revealPercent;
    final diameter = 2 * radius;

    return new Rect.fromLTWH(
        epicenter.dx - radius, epicenter.dy - radius, diameter, diameter);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}