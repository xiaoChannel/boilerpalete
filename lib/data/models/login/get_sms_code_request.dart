import 'dart:convert';

class GetSmsCodeRequest {
  GetSmsCodeRequest({
    required this.phone,
  });

  String phone;

  factory GetSmsCodeRequest.fromRawJson(String str) => GetSmsCodeRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetSmsCodeRequest.fromJson(Map<String, dynamic> json) => GetSmsCodeRequest(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };
}
