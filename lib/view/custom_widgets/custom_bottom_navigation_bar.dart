import 'package:dodamdodam_fe/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<CustomNavigationItem> items;
  final void Function(int index) onTapItem;
  final int selectedIndex;

  const CustomBottomNavigationBar({
    required this.items,
    required this.onTapItem,
    this.selectedIndex = 0,
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 111,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [_background(context), _items()],
      ),
    );
  }

  Widget _background(BuildContext context) => Row(
    children: [
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 111,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.only(topRight: Radius.circular(35)),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 111,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(35)),
        ),
      ),
    ],
  );

  Widget _items() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(widget.items.length, (index) {
      final item = widget.items[index];
      return (_selectedIndex == index)
          ? item.selectedItem(() => _onItemTapped(index))
          : item.notSelectedItem(() => _onItemTapped(index));
    }),
  );

  void _onItemTapped(int index) {
    // 상태를 변경하여 UI를 다시 그리도록 합니다.
    setState(() {
      _selectedIndex = index;
    });
    // 부모 위젯에게 탭된 인덱스를 전달합니다.
    widget.onTapItem(index);
  }
}

class CustomNavigationItem {
  final SvgPicture icon;
  final String label;
  TextStyle labelStyle;

  CustomNavigationItem({
    required this.icon,
    required this.label,
    this.labelStyle = const TextStyle(fontWeight: FontWeight.w400, fontSize: 8),
  }) {}

  Widget notSelectedItem(GestureTapCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 50,
      height: 59,
      margin: EdgeInsets.all(11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.surface,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(label, style: labelStyle),
        ],
      ),
    ),
  );

  Widget selectedItem(GestureTapCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 50,
      height: 59,
      margin: EdgeInsets.all(11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.surfaceVariant,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(label, textAlign: TextAlign.center, style: labelStyle),
        ],
      ),
    ),
  );
}
