// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['access'] as String?,
      json['refresh'] as String?,
      json['username'] as String?,
      json['email'] as String?,
      json['id'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'username': instance.username,
      'email': instance.email,
      'id': instance.id,
    };
