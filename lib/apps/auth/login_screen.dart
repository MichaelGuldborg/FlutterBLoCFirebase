import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/bloc/auth/auth.dart';
import 'package:flutter_firebase_app/components/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: LoginForm(context)));
  }

  Widget LoginForm(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'email'),
            controller: _emailController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'password'),
            controller: _passwordController,
            obscureText: true,
          ),
          SizedBox(
            height: 16,
          ),
          RoundedButton(
              text: "Login",
              onPressed: () async {
                final authBloc = BlocProvider.of<AuthBloc>(context);
                final firebaseUser = await authBloc.service.signInWithEmail(
                    _emailController.text, _passwordController.text);
                authBloc.dispatch(SignIn(user: firebaseUser));
              }),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed("reset_password/");
              },
              child: Text("Forgot password"))
        ],
      ),
    );
  }
}
