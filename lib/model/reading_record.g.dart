// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingRecord _$ReadingRecordFromJson(Map<String, dynamic> json) =>
    ReadingRecord(
      dates: json['dates'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      pagesRead: json['pagesRead'] as num?,
      thought: json['thought'] as String?,
    );

Map<String, dynamic> _$ReadingRecordToJson(ReadingRecord instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'pagesRead': instance.pagesRead,
      'thought': instance.thought,
    };
