import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserReadingInfoBox extends ConsumerStatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const UserReadingInfoBox({
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.margin,
    super.key,
  });

  @override
  ConsumerState<UserReadingInfoBox> createState() => _UserReadingInfoBoxState();
}

class _UserReadingInfoBoxState extends ConsumerState<UserReadingInfoBox> {
  /// TODO:
  /// API 연동 대상
  /// - user 정보 등
  final String username = '도담이';
  final int daysWithApp = 20;
  final int completeTotalNum = 10;
  final int completeMonthNum = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 361,
        maxWidth: 361,
        minHeight: 100,
        maxHeight: 100,
      ),
      padding: widget.padding,
      margin: widget.margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${username}님과 함께 독서한지 ${daysWithApp}일차',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),

          Container(
            height: 52,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Text(
                        '•',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Text(
                      '지금까지 완독한 책 ${completeTotalNum}권',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Text(
                        '•',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Text(
                      '이번 달 완독한 책 ${completeTotalNum}권',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
