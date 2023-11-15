import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/theme_util.dart';

class DiscoverPage extends GetView {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GMTheme.cMainPageBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.register);
                },
                child: const Text("Go")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.uiWidget);
                },
                child: const Text("UI widget library")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.socialShare);
                },
                child: const Text("Social Share")),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.isarCourse);
                },
                child: const Text("Isar DB example")),
          ],
        ),
      ),
    );
  }
}
