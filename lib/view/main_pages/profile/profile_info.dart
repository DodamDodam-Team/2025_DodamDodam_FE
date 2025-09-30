import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInfoBox extends ConsumerStatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ProfileInfoBox({
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.margin,
    super.key,
  });

  @override
  ConsumerState<ProfileInfoBox> createState() => _ProfileInfoBoxState();
}

class _ProfileInfoBoxState extends ConsumerState<ProfileInfoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 361,
        maxWidth: 361,
        minHeight: 24,
        maxHeight: 67,
      ),
      padding: widget.padding,
      margin: widget.margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '프로필',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
