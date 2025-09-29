import 'package:dodamdodam_fe/view/main_pages/home/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadingRateAnnounceBox extends ConsumerStatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ReadingRateAnnounceBox({
    this.padding = const EdgeInsets.all(7),
    this.margin,
    super.key,
  });

  @override
  ConsumerState<ReadingRateAnnounceBox> createState() =>
      _ReadingRateAnnounceBoxState();
}

class _ReadingRateAnnounceBoxState
    extends ConsumerState<ReadingRateAnnounceBox> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      constraints: BoxConstraints(
        minWidth: 361,
        maxWidth: 361,
        minHeight: 57,
        maxHeight: 57,
      ),
      padding: widget.padding,
      margin: widget.margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(9),
            child: Image.asset(
              'assets/icons/verification_badge_opacity60.png',
              width: 25,
              height: 25,
            ),
          ),
          Text(
            '저번달에 비해 독서 완독률이 상승했어요!',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),

          /// TODO: 멘트 바뀌게 만들어야 함
        ],
      ),
    );
  }
}
