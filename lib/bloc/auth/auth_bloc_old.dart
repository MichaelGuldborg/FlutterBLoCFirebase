import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_app/bloc/auth/auth.dart';
import 'package:flutter_firebase_app/bloc/auth/auth_service.dart';

/*

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _auth = AuthService();

  @override
  AuthState get initialState => Uninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    }

    if (event is SignInAnonymously) {
      final firebaseUser = await _auth.signInAnonymously();
      yield Authenticated(firebaseUser);
    }

    if (event is SignInWithEmail) {
      try {
        final firebaseUser =
            await _auth.signInWithEmailAndPassword(event.email, event.password);
        yield Authenticated(firebaseUser);
      } catch (error) {
        yield Unauthenticated();
      }
    }

    if (event is SignInWithGoogle) {
      final firebaseUser = await _auth.signInWithGoogle();
      yield Authenticated(firebaseUser);
    }

    if (event is SignUpWithEmail) {
      try {
        final firebaseUser = await _auth.signUpWithEmailAndPassword(
            event.username, event.email, event.password);
        yield Authenticated(firebaseUser);
      } catch (error) {
        yield Unauthenticated();
      }
    }

    if (event is SignOut) {
      yield* _mapLogoutToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final firebaseUser = await _auth.getCurrentUser();
      if (firebaseUser != null) {
        yield Authenticated(firebaseUser);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthState> _mapLogoutToState() async* {
    await _auth.signOut();
    yield Unauthenticated();
  }
}
 */

