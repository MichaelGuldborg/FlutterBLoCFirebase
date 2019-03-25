import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/pages/auth/login.dart';
import 'package:flutter_firebase_app/pages/auth/register.dart';
import 'package:flutter_firebase_app/pages/auth/splash.dart';
import 'package:flutter_firebase_app/services/auth_service.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => new _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthService _authService = AuthService();
  final List<Widget> _views = [LoginPage(), RegisterPage(), SplashPage()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Authentication"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: _views[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
        ],
      ),
    );
  }

  _onLoginButtonPressed() {
    debugPrint('getCurrentUser()');
    //var user = _authService.getCurrentUser();
    //debugPrint('CurrentUser: $user');

    /*

    setState(() {
      view_index = (view_index + 1) % views.length;
    });
     */

    /*
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
    */
  }

  void _onTabTapped(int index) {
    //Navigator.of(context).pushReplacementNamed('/home');

    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
