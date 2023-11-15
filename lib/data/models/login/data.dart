import 'package:json_annotation/json_annotation.dart';
import 'userinfo.dart';
part 'data.g.dart';

@JsonSerializable()
class Data {
  Data();

  late Userinfo data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
