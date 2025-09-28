import 'package:dodamdodam_fe/config/colors.dart';
import 'package:dodamdodam_fe/view/main_pages/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

const Map<int, String> NAV_INDEX_ENDPOINT_MAPPER = {
  0: '/home',
  1: '/community',
  2: '/book_store',
  3: '/profile',
};

class MainPageShell extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainPageShell({required this.navigationShell, super.key});

  @override
  ConsumerState<MainPageShell> createState() => _MainPageShellState();
}

class _MainPageShellState extends ConsumerState<MainPageShell> {
  int _index = 0;

  void onTapBottomNavigation(int index) {
    final hasAlreadyOnBranch = index == widget.navigationShell.currentIndex;
    if (hasAlreadyOnBranch) {
      context.go(NAV_INDEX_ENDPOINT_MAPPER[index]!);
    } else {
      widget.navigationShell.goBranch(index);
    }
  }

  void _initNavigationIndex(BuildContext context) {
    final routerState = GoRouterState.of(context);
    late int index;
    for (final entry in NAV_INDEX_ENDPOINT_MAPPER.entries) {
      if (routerState.fullPath!.startsWith(entry.value)) {
        index = entry.key;
      }
    }
    setState(() => _index = index);
  }

  @override
  Widget build(BuildContext context) {
    _initNavigationIndex(context);

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
        items: [
          CustomNavigationItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 26,
              height: 26,
            ),
            label: '홈',
          ),

          CustomNavigationItem(
            icon: SvgPicture.asset(
              'assets/icons/chatbox.svg',
              width: 26,
              height: 26,
            ),
            label: '커뮤니티',
          ),

          CustomNavigationItem(
            icon: SvgPicture.asset(
              'assets/icons/book.svg',
              width: 26,
              height: 26,
            ),
            label: '독립서점',
          ),

          CustomNavigationItem(
            icon: SvgPicture.asset(
              'assets/icons/person.svg',
              width: 26,
              height: 26,
            ),
            label: '프로필',
          ),
        ],
        selectedIndex: _index,
        onTapItem: onTapBottomNavigation,
      ),
    );
  }
}
