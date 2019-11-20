import 'package:app/services/authorization.dart';
import 'package:app/services/local_storage/m_local_storage.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:flutter/material.dart';

class MAppleLogin extends StatefulWidget {
  const MAppleLogin({Key key}) : super(key: key);

  @override
  _MAppleLoginState createState() => _MAppleLoginState();
}

class _MAppleLoginState extends State<MAppleLogin> {
  @override
  String errorMessage;

  Widget build(BuildContext context) {
    final Future<bool> _isAvailableFuture = AppleSignIn.isAvailable();
    return SizedBox(
        width: 280,
        child: FutureBuilder<bool>(
            future: _isAvailableFuture,
            builder: (context, isAvailableSnapshot) {
              if (!isAvailableSnapshot.hasData) {
                return Container(child: Text('Loading...'));
              }

              return isAvailableSnapshot.data
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          SizedBox(
                            height: 10,
                          ),
                          AppleSignInButton(
                            onPressed: logIn,
                          ),
                          if (errorMessage != null) Text(errorMessage),
                        ])
                  : Text(
                      'Sign in With Apple not available. Must be run on iOS 13+');
            }));
  }

  void logIn() async {
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    switch (result.status) {
      case AuthorizationStatus.authorized:

        // Store user ID
        var storage = await MLocalStorage();
            storage.setString("userId", result.credential.user);

        // Navigate to secret page (shhh!)

        break;

      case AuthorizationStatus.error:
        print("Sign in failed: ${result.error.localizedDescription}");
        setState(() {
          errorMessage = "Sign in failed 😿";
        });
        break;

      case AuthorizationStatus.cancelled:
        print('User cancelled');
        break;
    }
  }

  void checkLoggedInState() async {
    var auth = new Authorize();
    final userId = await auth.isAuthorized();
    if (!userId) {
      print("No stored user ID");
      return;
    }

    final credentialState = await AppleSignIn.getCredentialState("TODO");
    switch (credentialState.status) {
      case CredentialStatus.authorized:
        print("getCredentialState returned authorized");
        break;

      case CredentialStatus.error:
        print(
            "getCredentialState returned an error: ${credentialState.error.localizedDescription}");
        break;

      case CredentialStatus.revoked:
        print("getCredentialState returned revoked");
        break;

      case CredentialStatus.notFound:
        print("getCredentialState returned not found");
        break;

      case CredentialStatus.transferred:
        print("getCredentialState returned not transferred");
        break;
    }
  }
}
