import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/apps/auth/auth_app.dart';
import 'package:flutter_firebase_app/bloc/auth/auth.dart';
import 'package:flutter_firebase_app/components/rounded_button.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlutterLogo(
                  size: 80.0,
                ),
                SizedBox(height: 16),
                Text(
                  "Flutter App",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RoundedButton(
                  text: "Login NO USER",
                  onPressed: () async {
                    final authBloc = BlocProvider.of<AuthBloc>(context);
                    final user = await authBloc.service.getCurrentUser();
                    authBloc.dispatch(SignIn(user: user));
                  },
                ),
                SizedBox(height: 16),
                RoundedButton(
                  text: "Login",
                  onPressed: () {
                    Navigator.of(context).pushNamed("login/");
                  },
                ),
                SizedBox(height: 16),
                RoundedButton(
                  text: "signInWithGoogle",
                  onPressed: () async {
                    final authBloc = BlocProvider.of<AuthBloc>(context);
                    final user = await authBloc.service.signInWithGoogle();
                    authBloc.dispatch(SignIn(user: user));
                  },
                ),
                SizedBox(height: 16),
                RoundedButton(
                  transparent: true,
                  text: "Register",
                  onPressed: () {
                    Navigator.of(context).pushNamed(AuthAppRoutes.register);
                  },
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
