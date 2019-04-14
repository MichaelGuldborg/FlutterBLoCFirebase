import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/apps/chat/chat_screen.dart';
import 'package:flutter_firebase_app/apps/event/event_edit_screen.dart';
import 'package:flutter_firebase_app/apps/event/event_screen.dart';
import 'package:flutter_firebase_app/apps/settings/settings_screen.dart';
import 'package:flutter_firebase_app/constants/routes.dart';

// Inherited widget
// https://medium.com/flutter-community/widget-state-buildcontext-inheritedwidget-898d671b7956

class UserProvider extends InheritedWidget {
  static FirebaseUser getCurrentUser(BuildContext context) =>
      (context.ancestorWidgetOfExactType(UserProvider) as UserProvider)
          .currentUser;

  final FirebaseUser currentUser;

  UserProvider({
    Key key,
    @required Widget child,
    @required this.currentUser,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    // Never update state
    return false;
  }
}

class HomeAppRoutes {
  static const auth = "auth/";
  static const login = "login/";
  static const register = "register/";
  static const reset_password = "reset_password/";
}

class DashboardApp extends StatefulWidget {
  final FirebaseUser currentUser;

  const DashboardApp({Key key, this.currentUser}) : super(key: key);

  @override
  DashboardAppState createState() => DashboardAppState();
}

class DashboardAppState extends State<DashboardApp> {
  @override
  Widget build(BuildContext context) {
    return UserProvider(
      currentUser: widget.currentUser,
      child: MaterialApp(
        home: EventScreen(),
        routes: <String, WidgetBuilder>{
          AppRoutes.settings: (BuildContext context) => SettingsScreen(),
          AppRoutes.event: (BuildContext context) => EventEditScreen(),
          AppRoutes.chat: (BuildContext context) => ChatScreen(),
        },
      ),
    );
  }
}
