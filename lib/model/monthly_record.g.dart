// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthlyRecord _$MonthlyRecordFromJson(Map<String, dynamic> json) =>
    MonthlyRecord(
      certifiedDates: (json['certifiedDates'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      totalTime: json['totalTime'] as String,
    );

Map<String, dynamic> _$MonthlyRecordToJson(MonthlyRecord instance) =>
    <String, dynamic>{
      'certifiedDates': instance.certifiedDates,
      'totalTime': instance.totalTime,
    };
