import 'package:json_annotation/json_annotation.dart';

part 'reading_record.g.dart';

@JsonSerializable()
class ReadingRecord {
  final String dates;
  final String startTime;
  final String endTime;
  final num? pagesRead;
  final String? thought;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? photoPath;

  ReadingRecord({
    required this.dates,
    required this.startTime,
    required this.endTime,
    this.pagesRead,
    this.thought,
    this.photoPath,
  });

  factory ReadingRecord.fromJson(Map<String, dynamic> json) =>
      _$ReadingRecordFromJson(json);

  Map<String, dynamic> toJson() => _$ReadingRecordToJson(this);
}
