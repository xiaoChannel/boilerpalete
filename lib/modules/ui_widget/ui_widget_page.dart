import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_controller.dart';
import '../../routes/routes.dart';
import '../../utils/theme_util.dart';

class UIWidgetPage extends GetView<LoginController> {
  const UIWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GMTheme.cMainPageBackground,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.uiSnackbar);
            },
            child: const Text("Snackbar")),
      ),
    );
  }
}
