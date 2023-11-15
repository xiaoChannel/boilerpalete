// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile()
  ..phone = json['phone'] as String?
  ..openid = json['openid'] as String?
  ..nickname = json['nickname'] as String?
  ..unionid = json['unionid'] as String?
  ..headimgurl = json['headimgurl'] as String?;

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'phone': instance.phone,
      'openid': instance.openid,
      'nickname': instance.nickname,
      'unionid': instance.unionid,
      'headimgurl': instance.headimgurl,
    };
