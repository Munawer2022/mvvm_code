/*
************************ hello_detail ************************
*/

import 'package:get_it/get_it.dart';
import 'package:test123/view_model/auth/login/login_cubit.dart';
import '/view_model/local/local_user_info_store_view_model.dart';
import '/repository/auth/forgot_password/forgot_password_base_api_service.dart';
import '/resource/app_navigator.dart';
import '../local/insecure_local_storage.dart';
import '/data/network/http_network.dart';
import '/data/network/network_base_api_services.dart';
import '/repository/auth/login/login_base_api_service.dart';
import '/repository/auth/sign_up/sign_up_base_api_service.dart';
import '/repository/auth/sign_up/sign_up_repository.dart';
import '/repository/test/test_base_api_service.dart';
import '/repository/test/test_repository.dart';
import '/view_model/auth/login/login_view_model.dart';
import '/view_model/auth/sign_up/sign_up_view_model.dart';
import '/view_model/test/test_cubit.dart';

import '/repository/auth/forgot_password/forgot_password_repository.dart';
import '/repository/auth/login/login_repository.dart';
import '/view_model/auth/forgot_password/forgot_password_view_model.dart';
import '/view_model/splash/splash_view_model.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<AppNavigator>(AppNavigator());
  getIt.registerSingleton<InsecureLocalStorage>(InsecureLocalStorage());
  getIt.registerSingleton<LocalUserInfoStoreViewModel>(
      LocalUserInfoStoreViewModel());
  getIt.registerSingleton<NetworkBaseApiServices>(HttpNetwork(getIt()));
/*
************************ Splash ************************
*/
  getIt.registerSingleton<SplashViewModel>(
      SplashViewModel(getIt(), getIt(), getIt()));

/*
************************ Login ************************
*/
  getIt.registerSingleton<LoginBaseApiServices>(LoginRepository(getIt()));
  getIt.registerSingleton<LoginViewModel>(
      LoginViewModel(getIt(), getIt(), getIt(), getIt()));

/*
************************ SignUp ************************
*/
  getIt.registerSingleton<SignUpBaseApiServices>(SignUpRepository(getIt()));
  getIt.registerSingleton<SignUpViewModel>(
      SignUpViewModel(getIt(), getIt(), getIt(), getIt()));
/*
************************ ForgotPassword ************************
*/
  getIt.registerSingleton<ForgotPasswordBaseApiServices>(
      ForgotPasswordRepository(getIt()));
  getIt.registerSingleton<ForgotPasswordViewModel>(
      ForgotPasswordViewModel(getIt(), getIt(), getIt(), getIt()));
/*
************************ Test ************************
*/
  getIt.registerSingleton<TestBaseApiServices>(TestRepository(getIt()));
  getIt.registerSingleton<TestViewModel>(
      TestViewModel(getIt(), getIt(), getIt())..test());
}
