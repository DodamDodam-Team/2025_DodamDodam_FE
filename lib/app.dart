import 'package:dodamdodam_fe/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:dodamdodam_fe/config/router.dart';
import 'package:dodamdodam_fe/config/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  final GlobalKey<NavigatorState> _rootNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router(_rootNavKey),
      theme: theme,
      builder: (context, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.background,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: child!,
          ),
        );
      },
    );
  }
}
