import 'package:get/get.dart';

import '../../data/api/providers/login_provider.dart';
import 'login_controller.dart';
import 'login_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginProvider>(LoginProvider(), permanent: true);
    Get.put<LoginRepository>(LoginRepository(apiProvider: Get.find()));
    Get.lazyPut<LoginController>(() => LoginController(apiRepository: Get.find()));
  }
}
