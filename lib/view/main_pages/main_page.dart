import 'package:dodamdodam_fe/config/colors.dart';
import 'package:dodamdodam_fe/view/main_pages/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainPageShell extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainPageShell({required this.navigationShell, super.key});

  @override
  ConsumerState<MainPageShell> createState() => _MainPageShellState();
}

class _MainPageShellState extends ConsumerState<MainPageShell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SvgPicture.asset(
            'assets/images/background_top_image.svg',
            width: MediaQuery.of(context).size.width,
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: widget.navigationShell,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: [],
        onTapItem: () {},
      ),
    );
  }
}
