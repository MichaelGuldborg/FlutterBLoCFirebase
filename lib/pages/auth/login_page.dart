import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/pages/auth/auth_background.dart';
import 'package:flutter_firebase_app/components/rounded_button.dart';
import 'package:path/path.dart';

class LoginPage extends StatelessWidget {
  Widget LoginForm() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'username'),
            //controller: _usernameController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'password'),
            //controller: _passwordController,
            obscureText: true,
          ),
          RoundedButton(text: "test", onPressed: () {}),
          OutlineButton(
            borderSide: BorderSide(color: Colors.green, width: 2.0),
            shape: StadiumBorder(),
            onPressed: _onLoginButtonPressed,
            child: Text(
              'test',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeeeeee),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[AuthBackground(), LoginForm()],
        ));
  }

  void _onLoginButtonPressed() {}
}
