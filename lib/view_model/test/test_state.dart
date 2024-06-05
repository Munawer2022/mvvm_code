// import '/model/test/test_model.dart';
// import '/utils/typedef_models.dart';

// class TestState {
//   final TypedefTest success;
//   final bool isLoading;
//   final String? error;

//   TestState({
//     required this.success,
//     required this.isLoading,
//     this.error,
//   });
//   factory TestState.initial() => TestState(
//         success: TestModel.empty().copyWith(),
//         isLoading: false,
//       );
//   TestState copyWith({
//     TypedefTest? success,
//     bool? isLoading,
//     String? error,
//   }) =>
//       TestState(
//         success: success ?? this.success,
//         isLoading: isLoading ?? this.isLoading,
//         error: error ?? this.error,
//       );
// }

import '/data/response/api_response.dart';
import '/utils/typedef_models.dart';

class TestState {
  final ApiResponse<TypedefTest> response;

  TestState({required this.response});

  factory TestState.initial() => TestState(
        response: ApiResponse.loading(),
        // response: ApiResponse.initial(TestModel.empty().copyWith()),
      );

  TestState copyWith({
    ApiResponse<TypedefTest>? response,
  }) =>
      TestState(
        response: response ?? this.response,
      );
}
