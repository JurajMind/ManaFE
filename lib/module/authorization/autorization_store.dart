import 'package:app/services/authorization.dart';
import 'package:mobx/mobx.dart';

part 'autorization_store.g.dart';

class AuthorizationStore = _AuthorizationStore with _$AuthorizationStore;

enum AuthorizationStatus { authorized, anonymous, inProgress }

abstract class _AuthorizationStore with Store {
  @observable
  AuthorizationStatus status = AuthorizationStatus.inProgress;

  @action
  getStatus() async {
    var auth = new Authorize();
    var status = await auth.isAuthorized();
    if (status) {
      this.status = AuthorizationStatus.authorized;
    } else {
      this.status = AuthorizationStatus.anonymous;
    }
  }
}
