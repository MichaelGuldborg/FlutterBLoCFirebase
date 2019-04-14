import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/bloc/auth/auth_bloc.dart';
import 'package:flutter_firebase_app/bloc/auth/auth_event.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Delay for visual effect
    Future.delayed(const Duration(seconds: 1), handleNavigation);
  }

  void handleNavigation() async {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final FirebaseUser currentUser = await authBloc.service.getCurrentUser();
    authBloc.dispatch(SignIn(user: currentUser));
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: deviceSize.height / 8,
                width: deviceSize.width / 2,
                child: FlutterLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
