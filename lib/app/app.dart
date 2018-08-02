import 'package:app/app/app.widget.dart';
import 'package:app/routes/app.routes.dart';
import 'package:app/routes/auth.routes.dart';
import 'package:app/services/http.service.dart';
import 'package:fluro/fluro.dart';

class App {
  // Application environment.
  static String environment;

  // Application router.
  static Router router;

  // Application providers.
  static ApiClient http;

  static String clientId;

  static String baseUri;

  // Create app.
  App({
    String environment,
    String baseUri,
    String clientId,
  }) {
    App.environment = environment;
    App.clientId = clientId;
    App.baseUri = baseUri;
    // Create app http service.
    App.http = new ApiClient(baseUri);

    // Create a router.
    final Router router = new Router();

    // Init and set app router.
    App.router = this.initializeRoutes(router);
  }

  // Let's init our routes.
  Router initializeRoutes(Router router) {
    new AppRoutes(router);
    new AuthRoutes(router);

    return router;
  }

  // App run.
  void run(runApp) {
    runApp(new AppWidget());
  }
}
