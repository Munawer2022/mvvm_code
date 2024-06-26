import 'package:provider/provider.dart';

import '../auth/forgot_password/forgot_password_view_model.dart';
import '../auth/login/login_view_model.dart';
import '../auth/sign_up/sign_up_view_model.dart';
import '../internet_connectivity/internet_connectivity_checker_view_model.dart';
import '../local/local_user_info_store_view_model.dart';
import '../test/test_view_model.dart';
import '../theme/theme_view_model.dart';
import 'injection_container.dart';

List<ChangeNotifierProvider> multiProvidersListInjection = [
  // ChangeNotifierProvider<InternetConnectivityCheckerViewModel>(
  //   create: (_) => getIt(),
  // ),
  ChangeNotifierProvider<SignUpViewModel>(
    create: (_) => getIt(),
  ),
  // ChangeNotifierProvider<LoginViewModel>(
  //   create: (_) => getIt(),
  // ),
  ChangeNotifierProvider<ForgotPasswordViewModel>(
    create: (_) => getIt(),
  ),
  // ChangeNotifierProvider<TestViewModel>(
  //   create: (_) => getIt(),
  // ),
  // ChangeNotifierProvider<ThemeViewModel>(
  //   create: (_) => getIt(),
  // ),
  // ChangeNotifierProvider<LocalUserInfoStoreViewModel>(
  //   create: (_) => getIt(),
  // ),
];
