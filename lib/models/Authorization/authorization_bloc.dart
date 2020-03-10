import 'dart:async';

import 'package:app/services/authorization.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'authorization_event.dart';
import 'authorization_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthorizeManager authManager;

  AuthenticationBloc({@required this.authManager}) : assert(authManager != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await authManager.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await authManager.authorize(event.userName, event.password);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authManager.signOut();
      yield AuthenticationUnauthenticated();
    }
  }
}
