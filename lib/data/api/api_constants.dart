class ApiConstants {
  static const baseUrl = 'https://admin-staging-gm-rabbit.omnisaas.cn';
}

enum LoginType {
  oneTap('one-tap'),
  wechat('wechat'),
  sms('sms'),
  unknown('');

  final String value;
  const LoginType(this.value);

  static LoginType loginType(String value) => LoginType.values.firstWhere((element) => element.value == value, orElse: () => LoginType.unknown);
}
