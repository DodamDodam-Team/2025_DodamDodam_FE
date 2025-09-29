import 'package:dodamdodam_fe/config/constants.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration decoration;

  const CustomCard({
    super.key,
    this.child,
    this.width = 361,
    this.height = 356,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    this.decoration = const BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: width,
        maxWidth: width,
        minHeight: height,
      ),
      padding: padding,
      decoration: decoration,
      alignment: Alignment.topCenter,
      child: child,
    );
  }
}
