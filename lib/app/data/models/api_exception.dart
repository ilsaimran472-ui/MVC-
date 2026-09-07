/// A typed exception the Repository layer throws so Controllers
/// never have to guess the shape of an error response.
class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;
}
