import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Constructing extends StatelessWidget {
  const Constructing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 144,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '곧 개발 예정이에요!',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),

          SvgPicture.asset('assets/icons/fixing.svg', width: 109, height: 109),
        ],
      ),
    );
  }
}
