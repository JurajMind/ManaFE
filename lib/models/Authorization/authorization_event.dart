import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String userName;
  final String password;

  const LoggedIn({@required this.userName, @required this.password});

  @override
  List<Object> get props => [userName, password];

  @override
  String toString() => 'LoggedIn { userName: $userName , password: $password }';
}

class LoggedExternalIn extends AuthenticationEvent {
  final String provider;
  final String externalToken;

  const LoggedExternalIn({@required this.provider, @required this.externalToken});

  @override
  List<Object> get props => [provider, externalToken];

  @override
  String toString() => 'LoggedIn { provider: $provider , externalToken: $externalToken }';
}

class LoggedOut extends AuthenticationEvent {}
