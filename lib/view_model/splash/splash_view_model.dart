import 'package:flutter/material.dart';
import 'package:test123/view_model/theme/get_theme.dart';
import '../test/test_view_model.dart';
import '/resource/navigation/app_navigator.dart';
import '/view_model/local/insecure_local_storage.dart';
import '/view_model/local/local_user_info_store_view_model.dart';
import '/view_model/test/test_cubit.dart';
import '/utils/routes/routes_name.dart';

class SplashViewModel {
  final AppNavigator _navigator;
  final InsecureLocalStorage _userInfo;
  final LocalUserInfoStoreViewModel _userInfoDataSources;
  final TestViewModel _viewModel;
  final GetTheme _getTheme;

  SplashViewModel(this._navigator, this._userInfo, this._userInfoDataSources,
      this._viewModel, this._getTheme);

  void checkAuthentication(BuildContext context) {
    _getTheme.getTheme();
    _userInfo.getUserInfo().then(
        (userInfo) => userInfo.token.toString() == 'null' ||
                userInfo.token.toString() == ''
            ? _navigator.pushNamed(
                context: context, routeName: RoutesName.login)
            : _userInfoDataSources
                .setUserInfoDataSources(userInfo: userInfo)
                .then((value) => _viewModel.test().then((value) => _navigator
                    .pushNamed(context: context, routeName: RoutesName.test)))
        // Future.delayed(const Duration(seconds: 2),
        //     () => _navigator.pushNamed(context, RoutesName.test)
        );
  }
}
