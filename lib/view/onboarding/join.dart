import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/view/custom_widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class JoinPage extends ConsumerStatefulWidget {
  const JoinPage({super.key});

  @override
  ConsumerState<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends ConsumerState<JoinPage> {
  List<TextEditingController> controllerList = [
    TextEditingController(), // ID
    TextEditingController(), // Password
    TextEditingController(), // Password Check
  ];

  bool _isChecked = false;

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png", width: 290, height: 205),

          _index == 0 ? _privacyPolicy() : _signUp(),
        ],
      ),
    );
  }

  Widget _privacyPolicy() {
    String term = '''제 1조 어쩌구저쩌구저쩌구어쩌구
 어쩌구저쩌구저쩌구저쩌구
제 4조 어쩌구저쩌구어쩌구
 어쩌구저쩌구저쩌구저쩌구제
1조 어쩌구저쩌구저쩌구어쩌구
 어쩌구저쩌구저쩌구저쩌구
제 4조 어쩌구저쩌구어쩌구
 어쩌구저쩌구저쩌구저쩌구
제 1조 어쩌구저쩌구저쩌구어쩌구
 어쩌구저쩌구저쩌구저쩌구
제 4조 어쩌구저쩌구어쩌구
 어쩌구저쩌구저쩌구저쩌구''';

    return Container(
      child: Column(
        children: [
          Text(
            '매일 조금씩,\n도담도담 성장하는 나의 독서',
            style: AppTextStyle.body.large.copyWith(
              fontSize: 28,
              fontFamily: 'GangwonEduSaeeum',
            ),
            textAlign: TextAlign.center,
          ),

          Container(
            width: 342,
            margin: EdgeInsets.only(top: 25, bottom: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: AppTextStyle.body.medium.copyWith(fontSize: 18),
                        children: [
                          TextSpan(
                            text: '개인정보 이용약관',
                            style: AppTextStyle.body.medium.copyWith(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' 확인'),
                        ],
                      ),
                    ),

                    CustomCheckbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value;
                        });
                      },
                      iconSize: 18,
                      shape: CheckBoxShape.rectangle,
                    ),
                  ],
                ),

                Container(
                  width: 342,
                  height: 143,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(color: AppColors.onBoardingSurface),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Text(term, maxLines: 8),
                  ),
                ),
              ],
            ),
          ),

          _nextButton(
            onTap: () {
              setState(() {
                _index = 1;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _signUp() {
    return Container(
      child: Column(
        children: [
          _inputField(),
          _signUpButton(
            onTap: () {
              GoRouter.of(context).go('/home');
            },
          ),
        ],
      ),
    );
  }

  Widget _inputField() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 170,
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
              hintText: '비밀번호 확인',
            ),
          ),
        ],
      ),
    );
  }

  Widget _signUpButton({GestureTapCallback? onTap}) {
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
          '회원가입',
          style: AppTextStyle.onPrimary.extraLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _nextButton({GestureTapCallback? onTap}) {
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
          '다음',
          style: AppTextStyle.onPrimary.extraLarge.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
