import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme_util.dart';

class UISnackbarPage extends GetView {
  const UISnackbarPage({super.key});

  Future<bool> _willPopCallback() async {
    // Prevent iOS swipe back
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: GMTheme.cRegisterPageBackground),
          width: Get.height,
          height: Get.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                Flushbar(
                  title: "Hey user",
                  message: "This is a test message",
                  duration: const Duration(seconds: 3),
                ).show(context);
              },
              child: const Text('Basic snackbar'),
            ),
            ElevatedButton(
                onPressed: () {
                  Flushbar(
                          title: "Hey user",
                          message: "This is a test message",
                          duration: const Duration(seconds: 3),
                          flushbarPosition: FlushbarPosition.TOP,
                          flushbarStyle: FlushbarStyle.GROUNDED)
                      .show(context);
                },
                child: const Text('Top grounded snackbar')),
            ElevatedButton(
                onPressed: () {
                  Flushbar(
                    title: "Hey user",
                    message: "This is a test message",
                    backgroundGradient: const LinearGradient(colors: [Colors.blue, Colors.teal]),
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.red,
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    boxShadows: const [
                      BoxShadow(
                        color: Colors.blue,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 3.0,
                      )
                    ],
                  ).show(context);
                },
                child: const Text('Colorful background snackbar with icon')),
            ElevatedButton(
              onPressed: () {
                Flushbar(
                  title: "Hey user",
                  titleColor: Colors.white,
                  message: "This is a test message",
                  flushbarPosition: FlushbarPosition.TOP,
                  flushbarStyle: FlushbarStyle.FLOATING,
                  reverseAnimationCurve: Curves.decelerate,
                  forwardAnimationCurve: Curves.elasticOut,
                  backgroundColor: Colors.red,
                  boxShadows: const [BoxShadow(color: Colors.blue, offset: Offset(0.0, 2.0), blurRadius: 3.0)],
                  backgroundGradient: const LinearGradient(colors: [Colors.blueGrey, Colors.black]),
                  isDismissible: false,
                  duration: const Duration(seconds: 4),
                  icon: const Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                  ),
                  mainButton: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "confirm",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                  showProgressIndicator: true,
                  progressIndicatorBackgroundColor: Colors.blueGrey,
                  titleText: Text(
                    "Hello",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.yellow[600], fontFamily: "ShadowsIntoLightTwo"),
                  ),
                  messageText: const Text(
                    "You see a full customized snackbar. Congratulations!",
                    style: TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
                  ),
                ).show(context);
              },
              child: const Text('Full customizated snackbar'),
            )
          ]),
        ),
      ),
    );
  }
}
