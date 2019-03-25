import 'package:flutter/material.dart';
import 'package:path/path.dart';

class LoginPage extends StatelessWidget {

  LoginPage();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(8.0),
      child: new Column(
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
          RaisedButton(
            onPressed: _onLoginButtonPressed,
            child: Text('Login'),
          ),
        ],
      ),
    ));
  }

  void _onLoginButtonPressed() {
  }
}
