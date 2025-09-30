import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/view/main_pages/home/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCard(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            maxWidth: MediaQuery.of(context).size.width,
            minHeight: 429,
            maxHeight: 429,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: AppColors.background,
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // .png
              Image.asset('assets/icons/close.png', width: 23, height: 23),

              // .svg
              //SvgPicture.asset('assets/icons/...');
            ],
          ),
        ),
      ],
    );
  }
}
