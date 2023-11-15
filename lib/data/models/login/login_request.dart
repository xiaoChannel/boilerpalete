import 'dart:convert';

class LoginRequest {
  LoginRequest({
    required this.type,
    required this.code,
    this.phone,
  });

  String type;
  String code;
  String? phone;

  factory LoginRequest.fromRawJson(String str) => LoginRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        type: json["type"],
        code: json["code"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {"type": type, "code": code, "phone": phone};
}
