import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const []]) : super(props);
}

class Uninitialized extends AuthState {
  @override
  String toString() => 'Uninitialized';
}

class Unauthenticated extends AuthState {
  @override
  String toString() => 'Unauthenticated';
}

class Authenticated extends AuthState {
  final FirebaseUser currentUser;

  Authenticated(this.currentUser) : super([currentUser]);

  @override
  String toString() => 'Authenticated { currentUser: $currentUser}';
}
