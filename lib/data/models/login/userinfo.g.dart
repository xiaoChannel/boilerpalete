// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userinfo _$UserinfoFromJson(Map<String, dynamic> json) => Userinfo()
  ..token = json['token'] as String
  ..profile = Profile.fromJson(json['profile'] as Map<String, dynamic>);

Map<String, dynamic> _$UserinfoToJson(Userinfo instance) => <String, dynamic>{
      'token': instance.token,
      'profile': instance.profile,
    };
