// import 'package:flutter/material.dart';
// import 'package:test123/resource/navigation/app_navigator.dart';
// import 'package:test123/utils/show/show_error/show_errors.dart';
// import 'package:test123/view_model/theme/theme_view_model.dart';
// import 'package:test123/view_model/theme/update_theme.dart';
// import '/utils/routes/routes_name.dart';
// import '/view_model/local/insecure_local_storage.dart';
// import '/utils/typedef_models.dart';
// import '/repository/test/test_base_api_service.dart';
// import '/data/response/api_response.dart';

// class TestViewModel extends ChangeNotifier {
//   final TestBaseApiServices _baseApiService;
//   final InsecureLocalStorage _localStorage;
//   final AppNavigator _navigator;
//   final ShowError _showError;
//   final UpdateTheme _updateTheme;
//   final ThemeViewModel _theme;

//   TestViewModel(this._baseApiService, this._localStorage, this._navigator,
//       this._showError, this._updateTheme, this._theme);

//   ApiResponse<TypedefTest> response = ApiResponse.loading();

//   setLoading(ApiResponse<TypedefTest> data) {
//     response = data;
//     notifyListeners();
//   }

//   Future<void> test() async {
//     setLoading(ApiResponse.loading());

//     _baseApiService.test().then((value) {
//       setLoading(ApiResponse.completed(value));
//     }).onError((error, stackTrace) {
//       _showError.showErrorMaterialBanner(error.toString());

//       setLoading(ApiResponse.error(error.toString()));
//     });
//   }

//   removeToken(BuildContext context) => _localStorage
//       .removeUserInfo()
//       .then((value) => _navigator.pushNamedAndRemoveUntil(
//             context: context,
//             routeName: RoutesName.login,
//             predicate: (route) => false,
//           ));

//   void onThemeChanged(bool value) => _updateTheme.updateTheme(value);

//   Future<void> refresh() async {
//     await test();
//   }

//   bool _isDarkTheme = false;
//   bool get isDarkTheme => _isDarkTheme;

//   onInit() {
//     _isDarkTheme = _theme.isDarkTheme;
//     _theme.addListener(() => _isDarkTheme = _theme.isDarkTheme);
//   }
// }
