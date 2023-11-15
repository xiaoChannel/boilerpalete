import 'package:get/get.dart';

import 'modules/main/main_controller.dart';
import 'settings/settings.dart';
import 'settings/shared_preference_settings.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Initial all settings and controllers
    Get.put<Settings>(SharedPreferenceSettings());
    Get.put<MainController>(MainController(settings: Get.find()));
  }
}
