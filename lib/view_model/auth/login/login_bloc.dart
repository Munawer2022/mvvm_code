import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/view_model/auth/login/login_event.dart';
import 'package:test123/view_model/local/local_user_info_store_event.dart';
import 'package:test123/view_model/test/test_event.dart';
import '../../test/test_view_model.dart';
import '/resource/navigation/app_navigator.dart';
import '/view_model/test/test_bloc.dart';
import '/view_model/test/test_cubit.dart';
import '/view_model/auth/login/login_state.dart';
import '/view_model/local/insecure_local_storage.dart';
import '/view_model/local/local_user_info_store_view_model.dart';
import '/repository/auth/login/login_base_api_service.dart';
import '/utils/routes/routes_name.dart';

class LoginViewModel extends Bloc<LoginEvent, LoginState> {
  final LoginBaseApiServices _baseApiService;
  final InsecureLocalStorage _userInfo;
  final AppNavigator _navigator;
  final LocalUserInfoStoreViewModel _userInfoDataSources;
  final TestViewModel _viewModel;

  LoginViewModel(this._baseApiService, this._userInfo, this._navigator,
      this._userInfoDataSources, this._viewModel)
      : super(LoginState.initial()) {
    on<Login>(_login);
  }

  Future<void> _login(Login event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _baseApiService.login(body: event.body).then((userInfo) {
      emit(state.copyWith(isLoading: false));
      _userInfo.saveUserInfo(userInfo: userInfo).then((value) {
        _userInfoDataSources
            // .setUserInfoDataSources(userInfo: userInfo)
            .add(SetUserInfoDataSources(userInfo: userInfo));
        // .then((value) {

        _viewModel.add(Test(context: event.context));
        _navigator.pushNamedAndRemoveUntil(
          context: event.context,
          routeName: RoutesName.test,
          predicate: (route) => false,
        );
        // });
      });
    }).onError((error, stackTrace) {
      emit(state.copyWith(isLoading: false, error: error.toString()));
    });
  }
}

//   Future<void> _login(Login event, Emitter<LoginState> emit) async {
//     emit(state.copyWith(isLoading: true));
//     await _baseApiService.login(body: event.body).then((userInfo) {
//       emit(state.copyWith(isLoading: false));
//       _userInfo.saveUserInfo(userInfo: userInfo).then((value) {
//         _userInfoDataSources.setUserInfoDataSources(userInfo: userInfo).then(
//             (value) => _viewModel
//                 .test()
//                 .then((value) => _navigator.pushNamedAndRemoveUntil(
//                       context: event.context,
//                       routeName: RoutesName.test,
//                       predicate: (route) => false,
//                     )));
//       });
//     }).onError((error, stackTrace) {
//       emit(state.copyWith(isLoading: false, error: error.toString()));
//     });
//   }
// }
