import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class SignIn extends AuthEvent {
  final FirebaseUser user;

  SignIn({@required this.user}) : super([user]);

  @override
  String toString() => 'SignIn { user: ${user.toString()}';
}

class SignOut extends AuthEvent {
  @override
  String toString() => 'SignOut';
}

/*

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class SignInAnonymously extends AuthEvent {
  @override
  String toString() => 'SignInAnonymously';
}

class SignInWithGoogle extends AuthEvent {
  @override
  String toString() => 'SignInWithGoogle';
}

class SignInWithEmail extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmail({
    @required this.email,
    @required this.password,
  }) : super([email, password]);

  @override
  String toString() => 'SignInWithEmail { email: $email, password: $password }';
}

class SignUpWithEmail extends AuthEvent {
  final String username;
  final String email;
  final String password;

  SignUpWithEmail({
    @required this.username,
    @required this.email,
    @required this.password,
  }) : super([username, email, password]);

  @override
  String toString() =>
      'SignUpWithEmail { username: $username, email: $email, password: $password }';
}

class SignOut extends AuthEvent {
  @override
  String toString() => 'SignOut';
}

 */
