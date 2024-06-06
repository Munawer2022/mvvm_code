import '/model/test/test_model.dart';

import '/data/response/api_response.dart';
import '/utils/typedef_models.dart';

class TestState {
  final ApiResponse<TypedefTest> response;

  TestState({required this.response});

  factory TestState.initial() => TestState(
        response: ApiResponse.initial(TestModel.empty().copyWith()),
      );

  TestState copyWith({
    ApiResponse<TypedefTest>? response,
  }) =>
      TestState(
        response: response ?? this.response,
      );
}
