import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate_app/utils/notification_controller.dart';
import 'package:flutter_boilerplate_app/routes/app_pages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:uni_links/uni_links.dart';

import 'app_binding.dart';
import 'modules/main/main_page.dart';
import 'utils/theme_util.dart';
import 'package:fluwx/fluwx.dart';
import 'package:oktoast/oktoast.dart';
import './app_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsController.initializeNotificationService();
  const wechatConfig = WeChatConfig(appId: 'wxd930ea5d5a258f4f', universalLink: 'https://your.univerallink.com/link/');
  const configuredApp =
      AppConfig(environment: Environment.staging, appTitle: 'Flutter boilerplate app (staging)', weChatConfig: wechatConfig, child: OKToast(child: MyApp()));
  runApp(configuredApp);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _initFluwx();
      _initDeepLinks();
    });
  }

  void _initDeepLinks() {
    getInitialUri().then((Uri? uri) {
      if (uri != null && uri.host == "example.com") {
        _handleDeepLink(uri);
      }
    });

    // Listen for incoming deep links
    uriLinkStream.listen((Uri? uri) {
      if (uri != null && uri.host == "example.com") {
        _handleDeepLink(uri);
      }
    }, onError: (err) {
      print('Error listening to deep links: $err');
    });
  }

  void _handleDeepLink(Uri uri) {
    print('Incoming deeplink link uri $uri');
    if (Routes.matches(uri.path)) {
      Get.toNamed(uri.path);
    } else {
      Get.toNamed(Routes.main);
    }
  }

  _initFluwx() async {
    // We are missing two things here:
    // - A real univerallink
    // - A real WeChat open platform AppID
    // So after WeChat is woken up, it will show an univerallink error.
    // more details can be found here: https://wiredcraft.atlassian.net/wiki/spaces/knowledge/pages/756318339/GM+Flutter+APP+Social+Share+Investigation#Register-Fluwx
    await registerWxApi(
      appId: AppConfig.of(context).weChatConfig.appId,
      doOnAndroid: AppConfig.of(context).weChatConfig.doOnAndroid,
      doOnIOS: AppConfig.of(context).weChatConfig.doOniOS,
      universalLink: AppConfig.of(context).weChatConfig.universalLink,
    );
    var result = await isWeChatInstalled;
    print('is installed $result');
  }

  @override
  Widget build(BuildContext context) {
    // Set app support orientations (not required)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return FutureBuilder(
      builder: (context, AsyncSnapshot<String> snapshot) {
        return GetMaterialApp(
          title: 'GM Tutorial (staging)',
          theme: ThemeData(fontFamily: Platform.isIOS ? GMTheme.fmPFSC : GMTheme.fmNSSC),
          initialRoute: AppPages.initial,
          initialBinding: AppBinding(),
          getPages: AppPages.routes,
          home: const MainPage(),
          builder: EasyLoading.init(),
          onInit: () {
            NotificationsController.startListeningNotificationEvents();
          },
        );
      },
    );
  }
}
