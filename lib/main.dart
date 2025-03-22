import 'package:flutter/material.dart';
import 'package:untitled1/Dashboard.dart';
import 'package:untitled1/Registration.dart';
import 'package:untitled1/login.dart';
import 'package:untitled1/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await SharedPrefs.getToken();
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: isLoggedIn ? DashboardScreen() : LoginScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
