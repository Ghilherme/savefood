import 'package:flutter/material.dart';
import 'maps_home_screen.dart';
import 'Constants/constants.dart' as constants;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: constants.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MapsHomeScreen(),
    );
  }
}
