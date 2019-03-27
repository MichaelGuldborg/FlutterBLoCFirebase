import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/constants/colors.dart';
import 'package:flutter_firebase_app/pages/auth/index_page.dart';
import 'package:flutter_firebase_app/pages/auth/login_page.dart';
import 'package:flutter_firebase_app/pages/auth/register_page.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => new _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //final AuthService _authService = AuthService();
  //final List<Widget> _views = [LoginPage(), RegisterPage(), SplashPage()];
  //int _currentIndex = 0;

  PageController _controller = PageController(initialPage: 1);

  navigateTo(int pageIndex) {
    _controller.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 600),
      curve: Curves.ease,
    );
  }

  Future<bool> _onWillPop() {
    final pageIndex = _controller.page.round();
    print(pageIndex);
    if (pageIndex != 1) {
      navigateTo((pageIndex - 1).abs());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            body: Container(
          color: AppColors.primary,
          child: PageView(
            controller: _controller,
            children: <Widget>[
              RegisterPage(),
              IndexPage(this.navigateTo),
              LoginPage()
            ],
          ),
        )));
  }
}
