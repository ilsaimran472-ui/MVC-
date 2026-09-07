import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvc/app/core/constants/storage_keys.dart';
import '../../core/constants/api_constants.dart';


/// The ONLY class in the app that talks HTTP.
/// Controllers never call http/GetConnect directly — they go through
/// a Repository, which goes through this Provider. That's what makes
/// swapping reqres.in for your real backend a one-file change.
class ApiProvider extends GetConnect {
  final _box = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants.baseUrl;
    httpClient.timeout =
        const Duration(seconds: ApiConstants.connectTimeoutSeconds);

    // Attach auth token + default headers to every outgoing request.
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      final token = _box.read(StorageKeys.token);
      if (token != null && token.toString().isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $token';
      }
      return request;
    });

    // Central place to react to 401s (e.g. force logout) later on.
    httpClient.addResponseModifier((request, response) {
      return response;
    });

    super.onInit();
  }

  // ---------------- Auth ----------------

  Future<Response> login(Map<String, dynamic> body) {
    return post(ApiConstants.login, body);
  }

  Future<Response> register(Map<String, dynamic> body) {
    return post(ApiConstants.register, body);
  }

  // ---------------- Generic helpers for future modules ----------------

  Future<Response> getData(String endpoint) => get(endpoint);

  Future<Response> postData(String endpoint, Map<String, dynamic> body) =>
      post(endpoint, body);

  Future<Response> putData(String endpoint, Map<String, dynamic> body) =>
      put(endpoint, body);

  Future<Response> deleteData(String endpoint) => delete(endpoint);
}
