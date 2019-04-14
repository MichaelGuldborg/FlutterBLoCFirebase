import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_app/bloc/auth/auth.dart';
import 'package:flutter_firebase_app/bloc/auth/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _service = AuthService();

  AuthService get service => _service;

  @override
  AuthState get initialState => Uninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignIn && event.user != null) {
      yield Authenticated(event.user);
      return;
    }
    if (event is SignOut) {
      service.signOut();
    }
    yield Unauthenticated();
  }
}
