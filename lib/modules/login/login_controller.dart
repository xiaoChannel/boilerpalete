import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api/api_constants.dart';
import '../../data/models/login/get_sms_code_request.dart';
import '../../data/models/login/login_request.dart';
import 'login_repository.dart';
import '../../utils/focus.dart';
import '../../widgets/common_widget.dart';

class LoginController extends GetxController {
  final LoginRepository apiRepository;

  LoginController({required this.apiRepository});

  final loginUsernameController = TextEditingController();
  final loginCodeController = TextEditingController();
  String? phone;
  String? token;
  String? smsCode;
  bool isLoginFailed = false;

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    final res = await apiRepository.login(
      LoginRequest(type: LoginType.sms.value, code: loginCodeController.text, phone: loginUsernameController.text),
    );

    if (res != null) {
      final prefs = Get.find<SharedPreferences>();
      prefs.setString("authToken", res.data.token);
      phone = res.data.profile.phone;
      token = res.data.token;
      Get.back();
    } else {
      isLoginFailed = true;
    }
  }

  void getSmsCode(BuildContext context) async {
    AppFocus.unfocus(context);
    final res = await apiRepository.getSmsCode(
      GetSmsCodeRequest(phone: loginUsernameController.text),
    );
    if (res != null) {
      CommonWidget.toast(res);
    }
  }

  @override
  void onClose() {
    super.onClose();
    loginUsernameController.dispose();
    loginCodeController.dispose();
  }
}
