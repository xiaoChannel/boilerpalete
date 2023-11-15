import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/notification_controller.dart';
import '../../routes/routes.dart';
import '../../utils/theme_util.dart';

class ProfilePage extends GetView {
  const ProfilePage({super.key});

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
                    Get.toNamed(Routes.login);
                  },
                  child: const Text("Login")),
              ElevatedButton(
                  onPressed: () {
                    NotificationsController.createNewNotification();
                  },
                  child: const Text("send notification"))
            ],
          ),
        ));
  }
}
