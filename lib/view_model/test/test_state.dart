import '/model/test/test_model.dart';

import '/data/response/api_response.dart';
import '/utils/typedef_models.dart';

class TestState {
  final ApiResponse<TypedefTest> response;
  final bool isDarkTheme;

  TestState({required this.response, required this.isDarkTheme});

  factory TestState.initial() => TestState(
        response: ApiResponse.initial(TestModel.empty().copyWith()),
        isDarkTheme: false,
      );

  TestState copyWith({ApiResponse<TypedefTest>? response, bool? isDarkTheme}) =>
      TestState(
          response: response ?? this.response,
          isDarkTheme: isDarkTheme ?? this.isDarkTheme);
}
