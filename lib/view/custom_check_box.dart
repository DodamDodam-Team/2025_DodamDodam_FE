import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final double? iconSize;
  final BoxShape? shape;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.iconSize,
    this.shape = BoxShape.circle,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  void _handleTap() {
    widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      borderRadius: BorderRadius.circular(widget.iconSize ?? 24.0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: widget.value
            ? Image.asset(
                widget.shape == BoxShape.circle
                    ? 'assets/icons/check_mark.png'
                    : 'assets/icons/check_mark_square.png',
                width: widget.iconSize,
                height: widget.iconSize,
              )
            : Image.asset(
                widget.shape == BoxShape.circle
                    ? 'assets/icons/check_mark_opacity30.png'
                    : 'assets/icons/check_mark_square_blank.png',
                width: widget.iconSize,
                height: widget.iconSize,
              ),
      ),
    );
  }
}
