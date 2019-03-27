import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/components/rounded_button.dart';
import 'package:flutter_firebase_app/constants/colors.dart';

class IndexPage extends StatelessWidget {
  Function(int pageIndex) navigateTo;

  IndexPage(Function(int pageIndex) navigateTo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlutterLogo(
                colors: Colors.green,
                size: 80.0,
              ),
              SizedBox(height: 16),
              Text(
                "Flutter App",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary),
              ),
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RoundedButton(
                text: "Login",
                onPressed: () {
                  navigateTo(2);
                },
              ),
              SizedBox(height: 16),
              RoundedButton(
                transparent: true,
                text: "Register",
                onPressed: () {
                  navigateTo(0);
                },
              ),
              SizedBox(height: 32),
            ],
          ),
          flex: 1,
        ),
      ],
    );
  }
}
/*

 */
