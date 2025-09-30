import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookStoreInfoBox extends ConsumerStatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const BookStoreInfoBox({
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.margin,
    super.key,
  });

  @override
  ConsumerState<BookStoreInfoBox> createState() => _BookStoreInfoBoxState();
}

class _BookStoreInfoBoxState extends ConsumerState<BookStoreInfoBox> {
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
            '독립서점',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),

          Text(
            '가까운 독립서점에서 새로운 추억을 만들어보세요!',
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
