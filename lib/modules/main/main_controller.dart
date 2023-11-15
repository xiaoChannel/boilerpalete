import 'package:get/get.dart';

import '../../settings/settings.dart';

class MainController extends GetxController {
  /// Selected tab index
  final tabIndex = 0.obs;
  final Settings settings;

  MainController({required this.settings});
}
