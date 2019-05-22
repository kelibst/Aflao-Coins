import 'package:flutter/material.dart';
import 'package:aflacoins_updated/pages/LandingPage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aflao Coins Updated",
      home: LandingPage(),
    );
  }
}
