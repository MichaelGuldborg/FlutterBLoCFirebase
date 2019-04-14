import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/apps/auth/auth_screen.dart';
import 'package:flutter_firebase_app/apps/auth/login_screen.dart';
import 'package:flutter_firebase_app/apps/auth/register_screen.dart';
import 'package:flutter_firebase_app/apps/auth/reset_password_screen.dart';

// Inherited widget
// https://medium.com/flutter-community/widget-state-buildcontext-inheritedwidget-898d671b7956

class AuthApp extends StatefulWidget {
  @override
  AuthAppState createState() => AuthAppState();
}

class AuthAppRoutes {
  static const auth = "auth/";
  static const login = "login/";
  static const register = "register/";
  static const reset_password = "reset_password/";
}

class AuthAppState extends State<AuthApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          // TODO CHECK iOS
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      initialRoute: AuthAppRoutes.auth,
      routes: <String, WidgetBuilder>{
        AuthAppRoutes.auth: (BuildContext context) => AuthScreen(),
        AuthAppRoutes.login: (BuildContext context) => LoginScreen(),
        AuthAppRoutes.register: (BuildContext context) => RegisterScreen(),
        AuthAppRoutes.reset_password: (BuildContext context) =>
            ResetPasswordScreen(),
      },
    );
  }
}
