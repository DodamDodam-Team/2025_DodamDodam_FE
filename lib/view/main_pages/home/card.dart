import 'package:dodamdodam_fe/config/constants.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  //final double width;
  //final double height;
  final BoxConstraints constraints;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxDecoration decoration;

  const CustomCard({
    super.key,
    this.child,
    //this.width = 361,
    //this.height = 356,
    this.constraints = const BoxConstraints(
      minWidth: 361,
      maxWidth: 361,
      minHeight: 356,
    ),
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    this.margin = EdgeInsets.zero,
    this.decoration = const BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      padding: padding,
      margin: margin,
      decoration: decoration,
      alignment: Alignment.topCenter,
      child: child,
    );
  }
}
