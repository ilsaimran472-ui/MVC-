import 'package:mvc/app/data/models/api_request_model.dart';
import 'package:mvc/app/data/models/auth_response.dart';
import '../models/api_exception.dart';
import '../providers/api_provider.dart';

/// Sits between Controllers and the Provider.
/// - Controllers call repository methods with typed request models.
/// - Repository calls the Provider, checks response.status, and either
///   returns a typed model or throws an ApiException.
/// Controllers therefore never touch raw JSON or Response objects.
class AuthRepository {
  final ApiProvider _apiProvider;

  AuthRepository({ApiProvider? apiProvider})
      : _apiProvider = apiProvider ?? ApiProvider();

  Future<AuthResponseModel> login(LoginRequestModel request) async {
    final response = await _apiProvider.login(request.toJson());

    if (response.statusCode == null || response.statusCode! >= 400) {
      final message = _extractError(response.body) ?? 'Login failed';
      throw ApiException(message, statusCode: response.statusCode);
    }

    return AuthResponseModel.fromJson(response.body as Map<String, dynamic>);
  }

  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    final response = await _apiProvider.register(request.toJson());

    if (response.statusCode == null || response.statusCode! >= 400) {
      final message = _extractError(response.body) ?? 'Registration failed';
      throw ApiException(message, statusCode: response.statusCode);
    }

    return AuthResponseModel.fromJson(response.body as Map<String, dynamic>);
  }

  String? _extractError(dynamic body) {
    if (body is Map<String, dynamic>) {
      return body['error']?.toString() ?? body['message']?.toString();
    }
    return null;
  }
}
