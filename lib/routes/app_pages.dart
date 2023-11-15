import 'package:flutter_boilerplate_app/modules/main/main_page.dart';
import 'package:get/get.dart';

import '../modules/login/login_binding.dart';
import '../modules/discover/discover_page.dart';
import '../modules/login/login_page.dart';
import '../modules/profile/profile_page.dart';
import '../modules/register/register_page.dart';
import '../modules/snackbar/ui_snackbar_page.dart';
import '../modules/ui_widget/ui_widget_page.dart';
import '../modules/vehicle/vehicle_page.dart';
import '../modules/social_share/social_share_page.dart';
import '../modules/isar_course/isar_course_page.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.main;

  static final routes = [
    // Every page should be lazy loaded
    GetPage(name: Routes.main, page: () => const MainPage()),
    GetPage(name: Routes.discover, page: () => const DiscoverPage()),
    GetPage(name: Routes.vehicle, page: () => const VehiclePage()),
    GetPage(name: Routes.profile, page: () => const ProfilePage()),
    GetPage(name: Routes.register, page: () => const RegisterPage()),
    GetPage(name: Routes.uiWidget, page: () => const UIWidgetPage()),
    GetPage(name: Routes.uiSnackbar, page: () => const UISnackbarPage()),
    GetPage(name: Routes.login, page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.socialShare, page: () => const SocialSharePage()),
    GetPage(name: Routes.isarCourse, page: () => IsarCourse())
  ];
}
