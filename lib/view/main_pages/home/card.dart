import 'package:dodamdodam_fe/config/constants.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;
  final BoxDecoration decoration;

  const CustomCard({
    super.key,
    this.child,
    this.width = 361,
    this.height = 356,
    this.decoration = const BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: child ?? Container(),
    );
  }
}
