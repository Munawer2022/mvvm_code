import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/view_model/theme/theme_view_model.dart';
import 'package:test123/view_model/theme/update_theme.dart';
import '/resource/navigation/app_navigator.dart';
import '/utils/show/show_error/show_errors.dart';
import '/view_model/test/test_state.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/local/insecure_local_storage.dart';
import '/repository/test/test_base_api_service.dart';
import '/data/response/api_response.dart';

class TestViewModel extends Cubit<TestState> {
  final TestBaseApiServices _baseApiService;
  final InsecureLocalStorage _localStorage;
  final AppNavigator _navigator;
  final ShowError _showError;
  final UpdateTheme _updateTheme;
  final ThemeViewModel _theme;

  TestViewModel(this._baseApiService, this._localStorage, this._navigator,
      this._showError, this._updateTheme, this._theme)
      : super(TestState.initial());

  onInit() {
    emit(state.copyWith(isDarkTheme: _theme.state));
    _theme.stream.listen((event) => emit(state.copyWith(isDarkTheme: event)));
  }

  Future<void> test() async {
    emit(state.copyWith(response: ApiResponse.loading()));
    _baseApiService
        .test()
        .then((value) =>
            emit(state.copyWith(response: ApiResponse.completed(value))))
        .onError((error, stackTrace) {
      _showError.showErrorMaterialBanner(error.toString());
      emit(state.copyWith(response: ApiResponse.error(error.toString())));
    });
  }

  removeToken(BuildContext context) => _localStorage
      .removeUserInfo()
      .then((value) => _navigator.pushNamedAndRemoveUntil(
            context: context,
            routeName: RoutesName.login,
            predicate: (route) => false,
          ));

  void onThemeChanged(bool value) => _updateTheme.updateTheme(value);

  Future<void> refresh() async {
    await test();
  }
}
