import 'package:json_annotation/json_annotation.dart';

part 'monthly_record.g.dart';

@JsonSerializable()
class MonthlyRecord {
  final List<String> certifiedDates;
  final String totalTime;

  MonthlyRecord({required this.certifiedDates, required this.totalTime});

  factory MonthlyRecord.fromJson(Map<String, dynamic> json) =>
      _$MonthlyRecordFromJson(json);

  Map<String, dynamic> toJson() => _$MonthlyRecordToJson(this);
}
