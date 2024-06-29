import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '/view_model/local/local_user_info_store_view_model.dart';
import '../app_exceptions.dart';
import 'network_base_api_services.dart';

class HttpNetwork implements NetworkBaseApiServices {
  final LocalUserInfoStoreViewModel _userInfoDataSources;
  HttpNetwork(this._userInfoDataSources);

  @override
  Future<T> getApi<T>({required String url}) async {
    T responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${_userInfoDataSources.state.userInfo.token}'
          // 'Authorization': 'Bearer ${_userInfoDataSources.userInfo.token}'
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse<T>(response);
    } on TimeoutException {
      throw 'Please check your internet connection and try again.';
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future<T> postApi<T>(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    T responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: body,
        headers: headers,
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse<T>(response);
    } on TimeoutException {
      throw 'Please check your internet connection and try again.';
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future<T> patchApi<T>(
      {required String url,
      required Map<String, dynamic> body,
      Map<String, String>? headers}) async {
    T responseJson;
    try {
      Response response = await patch(
        Uri.parse(url),
        body: body,
        headers: headers ??
            {
              'Authorization':
                  'Bearer ${_userInfoDataSources.state.userInfo.token}'
              // 'Authorization': 'Bearer ${_userInfoDataSources.userInfo.token}'
            },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse<T>(response);
    } on TimeoutException {
      throw 'Please check your internet connection and try again.';
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  T returnResponse<T>(http.Response response) {
    switch (response.statusCode) {
      case 200:
        T responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
      case 401:
      case 403:
        final Map<String, dynamic> responseJson = jsonDecode(response.body);
        throw responseJson['message'];
      case 500:
      case 404:
        throw FetchDataException(
            'Error occurred while communicating with server. Status code: ${response.statusCode}');
      default:
        throw FetchDataException(
            'Error occurred while communicating with server. Status code: ${response.statusCode}');
    }
  }
}
//   T returnResponse<T>(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         T responseJson = jsonDecode(response.body);
//         return responseJson;
//       case 400:
//         final Map<String, dynamic> responseJson = jsonDecode(response.body);
//         throw BadRequestException(responseJson['message']);
//       case 401:
//       case 403:
//         final Map<String, dynamic> responseJson = jsonDecode(response.body);
//         throw UnauthorizedException(responseJson['message']);
//       case 500:
//       case 404:
//         throw FetchDataException(
//             'Error occurred while communicating with server. Status code: ${response.statusCode}');
//       default:
//         throw FetchDataException(
//             'Error occurred while communicating with server. Status code: ${response.statusCode}');
//     }
//   }
// }
