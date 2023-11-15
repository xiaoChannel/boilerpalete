import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';
import '../../utils/theme_util.dart';
import 'widgets/bottom_navbar.dart';
import '../discover/discover_page.dart';
import '../profile/profile_page.dart';
import '../vehicle/vehicle_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  _buildCurrentPage() {
    List<Widget> pages = [
      const DiscoverPage(),
      const VehiclePage(),
      const ProfilePage(),
    ];
    return pages[controller.tabIndex.value];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: GMTheme.cBandBlack.withOpacity(.8),
        bottomNavigationBar: MyBottomNavBar(
          tabIndex: controller.tabIndex.value,
          onTap: (index) {
            controller.tabIndex.value = index;
          },
        ),
        body: _buildCurrentPage(),
      ),
    );
  }
}
