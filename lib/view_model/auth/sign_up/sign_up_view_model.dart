import 'package:flutter/material.dart';
import '/view_model/local/insecure_local_storage.dart';
import '/view_model/local/local_user_info_store_view_model.dart';
import '/resource/navigation/app_navigator.dart';
import '/repository/auth/sign_up/sign_up_base_api_service.dart';
import '/utils/routes/routes_name.dart';

class SignUpViewModel extends ChangeNotifier {
  final SignUpBaseApiServices _baseApiService;
  final InsecureLocalStorage _userInfo;
  final AppNavigator _navigator;
  final LocalUserInfoStoreViewModel _userInfoDataSources;

  SignUpViewModel(this._baseApiService, this._userInfo, this._navigator,
      this._userInfoDataSources);

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signUp(
      {required Map<String, dynamic> body,
      required BuildContext context}) async {
    setLoading(true);
    _baseApiService.signUp(body: body).then((userInfo) {
      setLoading(false);
      _userInfo.saveUserInfo(userInfo: userInfo).then((value) {
        // _userInfoDataSources.setUserInfoDataSources(userInfo: userInfo);
        _navigator.pushNamed(context: context, routeName: RoutesName.test);
      });
    }).onError((error, stackTrace) => setLoading(false));
  }
}
