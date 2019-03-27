import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/constants/routes.dart';
import 'package:flutter_firebase_app/pages/auth/auth_page.dart';
import 'package:flutter_firebase_app/pages/auth/splash.dart';
import 'package:flutter_firebase_app/pages/home/about.dart';
import 'package:flutter_firebase_app/pages/home/contact.dart';
import 'package:flutter_firebase_app/pages/home/home.dart';

void main() {
  runApp(FlutterFirebaseApp());
}

class FlutterFirebaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthPage(),
      routes: <String, WidgetBuilder>{
        Routes.auth: (BuildContext context) => AuthPage(),
        Routes.home: (BuildContext context) => HomePage(),
        '/about': (BuildContext context) => AboutPage(),
        '/contact': (BuildContext context) => ContactPage(),
      },
    );
  }
}
