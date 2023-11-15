import 'dart:async';

import '../../data/api/api.dart';
import '../../data/models/login/get_sms_code_request.dart';
import '../../data/models/login/index.dart';
import '../../data/models/login/login_request.dart';

class LoginRepository {
  LoginRepository({required this.apiProvider});

  final LoginProvider apiProvider;

  Future<Data?> login(LoginRequest data) async {
    final res = await apiProvider.login('/api/login', data);
    if (res.statusCode == 200) {
      return Data.fromJson(res.body);
    }
    return null;
  }

  Future<String?> getSmsCode(GetSmsCodeRequest data) async {
    final res = await apiProvider.getSmsCode('/api/sms/code', data);
    if (res.statusCode == 201) {
      return "sent success";
    }
    return null;
  }
}
