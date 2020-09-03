import 'package:flutter/material.dart';
import 'package:todolist/qTab.dart';
import 'const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homeState();
}

class _homeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 15.0,
            onPressed: null,
          ),
          title: Text(
            'ToDoDoDoDoDoDo',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
            tabs: tabmaker(),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            qTab(),
            Text("BITCH"),
            Text("SUCKY"),
            Text("DUCKY"),
          ],
        ),
      ),
    );
  }

  List<Tab> tabmaker() {
    List<Tab> tab = new List();
    categories.forEach((element) {
      tab.add(
        Tab(
          text: element,
        ),
      );
    });
    return tab;
  }
}
