// import 'package:flutter/material.dart';
// import '/utils/routes/routes_name.dart';
// import '/view_model/local/insecure_local_storage.dart';
// import '/resource/app_navigator.dart';
// import '/utils/typedef_models.dart';
// import '/repository/test/test_base_api_service.dart';
// import '/data/response/api_response.dart';

// class TestViewModel extends ChangeNotifier {
//   final TestBaseApiServices _baseApiService;
//   final InsecureLocalStorage _localStorage;
//   final AppNavigator _navigator;

//   TestViewModel(this._baseApiService, this._localStorage, this._navigator);

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
//       setLoading(ApiResponse.error(error.toString()));
//     });
//   }

//   removeToken(BuildContext context) => _localStorage
//       .removeUserInfo()
//       .then((value) => _navigator.pushNamed(context, RoutesName.login));
// }
