import 'package:get/get.dart';
import 'package:mvc/app/modules/login/views/login_view.dart';
import 'package:mvc/app/routes/app_routes.dart';

class AppPages{
  AppPages._();

  static final pages = <GetPage>[
    GetPage(name: AppRoutes.Login, page: () => const Login()),
    
  ];
}