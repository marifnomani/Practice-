import 'package:flutter/material.dart';
import 'package:untitled1/Registration.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegistrationScreen(),
    );
  }
}