import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/bloc/auth/auth_bloc.dart';
import 'package:flutter_firebase_app/bloc/auth/auth_event.dart';
import 'package:flutter_firebase_app/components/rounded_button.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: RegisterForm(context)));
  }

  Widget RegisterForm(BuildContext context) {
    final _usernameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'username'),
            controller: _usernameController,
          ),
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
              text: "Register",
              onPressed: () async {
                final authBloc = BlocProvider.of<AuthBloc>(context);
                final firebaseUser = await authBloc.service.signUpWithEmail(
                    _usernameController.text, _emailController.text, _passwordController.text);
                authBloc.dispatch(SignIn(user: firebaseUser));
              }),
        ],
      ),
    );
  }
}
