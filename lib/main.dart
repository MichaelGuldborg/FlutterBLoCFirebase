import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/apps/auth/auth_app.dart';
import 'package:flutter_firebase_app/apps/auth/splash_screen.dart';
import 'package:flutter_firebase_app/apps/dashboard/dashboard_app.dart';
import 'package:flutter_firebase_app/bloc/auth/auth.dart';
import 'package:flutter_firebase_app/simple_bloc_delegate.dart';

main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthBloc _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        bloc: _authBloc,
        child: BlocBuilder(
          bloc: _authBloc,
          builder: (BuildContext context, AuthState state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Unauthenticated) {
              return AuthApp();
            }
            if (state is Authenticated) {
              return DashboardApp(currentUser: state.currentUser);
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }
}
