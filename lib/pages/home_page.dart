import 'package:firstapp/fragments/first_fragment.dart';
import 'package:firstapp/fragments/second_fragment.dart';
import 'package:firstapp/fragments/third_fragment.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.widgets),
    new DrawerItem("Login", Icons.remove_red_eye),
    new DrawerItem("Fragment", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(        // -> Drawer for start from left side
//      drawer: new Container(      // -> Drawer for full screen drawer        // endDrawer: new Drawer  -> Drawer for start from right side
//      width: MediaQuery.of(context).size.width,
//      height: MediaQuery.of(context).size.height,
//      color: Colors.white,
//        elevation: 20.0,
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
//                accountName: new Text("John Doe"), accountEmail: null),
              accountName: new Text("Bhanu Prakash Dave"),
              accountEmail: new Text("bhanudave13@gmail.com"),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/images/lake.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/46.jpg")),
//            new Column(children: drawerOptions)
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
