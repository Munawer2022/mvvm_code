import '/repository/test/test_base_api_service.dart';
import '/data/network/network_base_api_services.dart';
import '/model/test/test_model.dart';
import '/utils/typedef_models.dart';
import '/resource/app_url.dart';

class TestRepository implements TestBaseApiServices {
  final NetworkBaseApiServices _baseApiServices;
  TestRepository(this._baseApiServices);

  @override
  Future<TypedefTest> test() async {
    try {
      var response =
          await _baseApiServices.getApi<Map<String, dynamic>>(url: AppUrl.test);
      return TestModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
