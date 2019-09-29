import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:sandec_tutorial/desert.dart';
import 'breakfast.dart';

void main() => runApp(
  MaterialApp(
    home: MyApp()
  )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _activePage = 0;

  List<Widget> pages = <Widget>[
    BreakfastPage(),
    DessertPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_activePage],
      bottomNavigationBar: FancyBottomNavigation(
      tabs: [
          TabData(iconData: Icons.home, title: "Breakfast"),
          TabData(iconData: Icons.search, title: "Dessert"),
      ],
      onTabChangedListener: (position) {
          setState(() {
          _activePage = position;
          });
      },
    )
    );
  }
}

