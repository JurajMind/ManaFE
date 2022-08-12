import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AccountApi
void main() {
  final instance = Openapi().getAccountApi();

  group(AccountApi, () {
    //Future<Object> accountConfirmEmail(String userId, String code) async
    test('test accountConfirmEmail', () async {
      // TODO
    });

    //Future<Object> accountForgotPassword(SmartHookahModelsForgotPasswordViewModel model) async
    test('test accountForgotPassword', () async {
      // TODO
    });

    //Future<Object> accountRegister(UserModel userModel) async
    test('test accountRegister', () async {
      // TODO
    });

    //Future<Object> accountResetPassword(String userId, String code) async
    test('test accountResetPassword', () async {
      // TODO
    });

  });
}
