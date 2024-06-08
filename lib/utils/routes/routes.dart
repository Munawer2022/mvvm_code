import 'package:flutter/material.dart';
import 'package:test123/view_model/injection/injection_container.dart';
import '../../view/auth/forgot_password/forgot_password_view.dart';
import '../../view/auth/sign_up/sign_up_view.dart';
import '/utils/routes/routes_name.dart';
import '/view/splash/splash_view.dart';

import '../../view/auth/login/login_view.dart';

import '../../view/test/test_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    PageRoute pageRoute = PageRoute();
    switch (settings.name) {
      case RoutesName.splash:
        return pageRoute.getPageRoute(const SplashView());

      case RoutesName.login:
        return pageRoute.getPageRoute(LoginView(
          cubit: getIt(),
        ));
      case RoutesName.signUp:
        return pageRoute.getPageRoute(const SignUpView());
      case RoutesName.forgotPassword:
        return pageRoute.getPageRoute(const ForgotPasswordView());

      case RoutesName.test:
        return pageRoute.getPageRoute(TestView(
          cubit: getIt(),
        ));
      default:
        return pageRoute.getDefaultRoute();
    }
  }
}

class PageRoute extends DefaultPageRoute {
  Route getPageRoute(page) => MaterialPageRoute(
        builder: (BuildContext context) => page,
      );
}

class DefaultPageRoute {
  Route getDefaultRoute() => MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('No route defined'),
          ),
        );
      });
}
