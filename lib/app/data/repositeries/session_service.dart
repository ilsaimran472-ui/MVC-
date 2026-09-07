import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mvc/app/core/constants/storage_keys.dart';
import 'package:mvc/app/data/models/auth_response.dart';
import 'package:mvc/app/data/models/user_model.dart';

/// Reusable session/persistence logic shared by Login, Signup, Splash
/// and Home. Registered once as a permanent GetX service (see main.dart)
/// so any controller can do `Get.find<SessionService>()`.
class SessionService extends GetxService {
  final _box = GetStorage();

  bool get isLoggedIn => _box.read(StorageKeys.isLoggedIn) ?? false;

  String? get token => _box.read(StorageKeys.token);

  UserModel? get currentUser {
    final raw = _box.read(StorageKeys.user);
    if (raw == null) return null;
    return UserModel.fromJson(Map<String, dynamic>.from(raw));
  }

  Future<void> saveSession(AuthResponseModel auth) async {
    await _box.write(StorageKeys.token, auth.token);
    await _box.write(StorageKeys.isLoggedIn, true);
    if (auth.user != null) {
      await _box.write(StorageKeys.user, auth.user!.toJson());
    }
  }

  Future<void> clearSession() async {
    await _box.remove(StorageKeys.token);
    await _box.remove(StorageKeys.user);
    await _box.remove(StorageKeys.isLoggedIn);
  }
}
