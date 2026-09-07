import 'user_model.dart';

/// Wraps whatever the login/register endpoint returns: a token, and
/// (when the API sends it) the user object. If your backend only
/// returns a token on login, `user` will simply be null there and
/// you fetch the profile separately — that's normal, not a bug.
class AuthResponseModel {
  final String token;
  final UserModel? user;

  AuthResponseModel({
    required this.token,
    this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token']?.toString() ?? '',
      user: json['user'] != null
          ? UserModel.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      if (user != null) 'user': user!.toJson(),
    };
  }
}
