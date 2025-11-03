import 'package:dodamdodam_fe/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  List<TextEditingController> controllerList = [
    TextEditingController(), // ID
    TextEditingController(), // Password
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png", width: 290, height: 205),

          _inputField(),

          _loginButton(
            onTap: () {
              GoRouter.of(context).go('/home');
            },
          ),

          _goSignUp(
            onTap: () {
              GoRouter.of(context).go('/join');
            },
          ),
        ],
      ),
    );
  }

  Widget _inputField() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            controller: controllerList[0],
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18),
            cursorColor: Color(0xff6C6C6C),
            cursorHeight: 14,
            decoration: InputDecoration(
              fillColor: AppColors.onBoardingSurface,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),

              contentPadding: EdgeInsets.symmetric(horizontal: 20),

              constraints: BoxConstraints(
                minWidth: 342,
                maxWidth: 342,
                minHeight: 50,
                maxHeight: 50,
              ),
              hintText: '아이디',
            ),
          ),

          TextFormField(
            controller: controllerList[1],
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 18),
            cursorColor: Color(0xff6C6C6C),
            cursorHeight: 14,
            decoration: InputDecoration(
              fillColor: AppColors.onBoardingSurface,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),

              contentPadding: EdgeInsets.symmetric(horizontal: 20),

              constraints: BoxConstraints(
                minWidth: 342,
                maxWidth: 342,
                minHeight: 50,
                maxHeight: 50,
              ),
              hintText: '비밀번호',
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton({GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: 342,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          '로그인',
          style: AppTextStyle.onPrimary.extraLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _goSignUp({GestureTapCallback? onTap}) {
    return Container(
      width: 342,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '아직 계정이 없으신가요? ',
            style: AppTextStyle.body.small.copyWith(fontSize: 15),
          ),

          GestureDetector(
            onTap: onTap,
            child: Text(
              '회원가입',
              style: AppTextStyle.body.small.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
