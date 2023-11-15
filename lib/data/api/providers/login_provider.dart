import 'package:get/get.dart';

import '../../models/login/login_request.dart';
import '../../models/login/get_sms_code_request.dart';
import 'base_provider.dart';

class LoginProvider extends BaseProvider {
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> getSmsCode(String path, GetSmsCodeRequest data) {
    return post(path, data.toJson());
  }
}
