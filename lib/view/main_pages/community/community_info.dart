import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityInfoBox extends ConsumerStatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CommunityInfoBox({
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.margin,
    super.key,
  });

  @override
  ConsumerState<CommunityInfoBox> createState() => _CommunityInfoBoxState();
}

class _CommunityInfoBoxState extends ConsumerState<CommunityInfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 361,
        maxWidth: 361,
        minHeight: 67,
        maxHeight: 67,
      ),
      padding: widget.padding,
      margin: widget.margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '커뮤니티',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),

          Text(
            '책이 들려주는 이야기로 함께 소통해요!',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
