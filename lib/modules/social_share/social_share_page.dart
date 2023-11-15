import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluwx/fluwx.dart';
import '../../utils/theme_util.dart';

class SocialSharePage extends GetView {
  const SocialSharePage({super.key});

  void shareH5ToWeChatFriends() {
    shareToWeChat(WeChatShareWebPageModel(
      "www.example.com",
      scene: WeChatScene.SESSION,
      title: "Example Title",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GMTheme.cBandBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: shareH5ToWeChatFriends,
              child: const Text('share H5 to WeChatFriends'),
            ),
          ],
        ),
      ),
    );
  }
}
