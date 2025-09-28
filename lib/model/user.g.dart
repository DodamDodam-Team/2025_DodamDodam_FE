// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  name: json['name'] as String,
  teaminfo: json['teaminfo'] as String?,
  monthlyGoal: json['monthlyGoal'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'name': instance.name,
  'teaminfo': instance.teaminfo,
  'monthlyGoal': instance.monthlyGoal,
};
