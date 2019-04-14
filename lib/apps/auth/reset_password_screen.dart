import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_app/bloc/auth/auth_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    String errorText = null;

    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: errorText,
              ),
              controller: _emailController,
              onFieldSubmitted: (test) {
                final email = test.trim();
                if (!email.contains('@')) {
                  return;
                }

                BlocProvider.of<AuthBloc>(context)
                    .service
                    .sendPasswordResetEmail(email);
              },
            ),
          )),
    );
  }
}
