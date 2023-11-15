import 'package:json_annotation/json_annotation.dart';
import 'profile.dart';
part 'userinfo.g.dart';

@JsonSerializable()
class Userinfo {
  Userinfo();

  late String token;
  late Profile profile;

  factory Userinfo.fromJson(Map<String, dynamic> json) => _$UserinfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserinfoToJson(this);
}
