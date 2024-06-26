import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/view_model/test/test_event.dart';
import 'package:test123/view_model/theme/theme_view_model.dart';
import 'package:test123/view_model/theme/update_theme.dart';
import '/resource/navigation/app_navigator.dart';
import '/utils/show/show_error/show_errors.dart';
import '/view_model/test/test_state.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/local/insecure_local_storage.dart';
import '/repository/test/test_base_api_service.dart';
import '/data/response/api_response.dart';

class TestViewModel extends Bloc<TestEvent, TestState> {
  final TestBaseApiServices _baseApiService;
  final InsecureLocalStorage _localStorage;
  final AppNavigator _navigator;
  final ShowError _showError;
  final UpdateTheme _updateTheme;
  final ThemeViewModel _theme;

  TestViewModel(this._baseApiService, this._localStorage, this._navigator,
      this._showError, this._updateTheme, this._theme)
      : super(TestState.initial()) {
    on<OnInit>(_onInit);
    on<Test>(_test);
    on<RemoveToken>(_removeToken);
    on<OnThemeChanged>(_onThemeChanged);
    on<NavigateToTestDetail>(_navigateToTestDetail);
    on<Refresh>(_refresh);
  }

  Future<void> _onInit(OnInit event, Emitter<TestState> emit) async {
    emit(state.copyWith(isDarkTheme: _theme.state));
    await _theme.stream
        .listen((event) async => emit(state.copyWith(isDarkTheme: event)))
        .asFuture();
  }

  Future<void> _test(Test event, Emitter<TestState> emit) async {
    emit(state.copyWith(response: ApiResponse.loading()));
    await _baseApiService
        .test()
        .then((value) =>
            emit(state.copyWith(response: ApiResponse.completed(value))))
        .onError((error, stackTrace) async {
      error.toString().contains('Token Expired!')
          ? await _localStorage.removeUserInfo().then((value) => _navigator
              .pushNamed(context: event.context, routeName: RoutesName.login))
          : _showError.showErrorMaterialBanner(error.toString());
      emit(state.copyWith(response: ApiResponse.error(error.toString())));
    });
  }

  Future<InsecureLocalStorage> _removeToken(
          RemoveToken event, Emitter<TestState> emit) async =>
      await _localStorage
          .removeUserInfo()
          .then((value) => _navigator.pushNamedAndRemoveUntil(
                context: event.context,
                routeName: RoutesName.login,
                predicate: (route) => false,
              ));

  void _onThemeChanged(OnThemeChanged event, Emitter<TestState> emit) =>
      _updateTheme.updateTheme(event.value);

  Future<AppNavigator> _navigateToTestDetail(
          NavigateToTestDetail event, Emitter<TestState> emit) async =>
      await _navigator.pushNamed(
          context: event.context,
          routeName: RoutesName.test_detail,
          arguments: {'model': event.model});

  Future<void> _refresh(Refresh event, Emitter<TestState> emit) async =>
      add(Test(context: event.context));
}
