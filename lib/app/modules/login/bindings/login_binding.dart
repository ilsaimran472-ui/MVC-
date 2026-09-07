import 'package:get/get.dart';
import 'package:mvc/app/data/repositeries/auth_repository.dart';
import 'package:mvc/app/modules/login/controllers/login_controler.dart';
import '../../../data/providers/api_provider.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(apiProvider: Get.find<ApiProvider>()),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(authRepository: Get.find<AuthRepository>()),
    );
  }
}
