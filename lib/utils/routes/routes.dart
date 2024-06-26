import 'package:test123/model/test/test_model.dart';

import '/view/test_detail/test_detail_view.dart';
import 'package:flutter/material.dart';
import '/resource/navigation/transition_type.dart';
import '/view/auth/forgot_password/forgot_password_view.dart';
import '/view/auth/login/login_view.dart';
import '/view/auth/sign_up/sign_up_view.dart';
import '/view/test/test_view.dart';
import '/resource/navigation/transition_type_checker.dart';
import '/view_model/injection/injection_container.dart';
import '/utils/routes/routes_name.dart';
import '/view/splash/splash_view.dart';

class Routes extends PageRoute with DefaultPageRoute {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return getPageRoute(const SplashView());
      case RoutesName.login:
        return getPageRoute(LoginView(viewModel: getIt()),
            transitionType: TransitionType.slideFromLeft);
      case RoutesName.signUp:
        return getPageRoute(const SignUpView());
      case RoutesName.forgotPassword:
        return getPageRoute(const ForgotPasswordView());
      case RoutesName.test:
        return getPageRoute(TestView(cubit: getIt()));

      case RoutesName.test_detail:
        return getPageRoute(TestDetailView(
          cubit: getIt(),
          model: settings.arguments as Map<String, TestModel>,
        ));
      default:
        return getDefaultRoute();
    }
  }
}

class PageRoute with TransitionTypeChecker {
  Route getPageRoute(Widget routeName,
      {TransitionType transitionType = TransitionType.slideFromRight}) {
    final route = transitionTypeChecker(routeName, transitionType);
    return route;
  }
}

mixin DefaultPageRoute {
  Route getDefaultRoute() => MaterialPageRoute(
      builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ));
}
