// Flutter code sample for material.AppBar.actions.1

// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'social.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kingdom Vision Life Center',
      theme: ThemeData(
        primaryColor: new Color(0xff008968),
      ),
      home: Dashboard(),
    );
  }
}
