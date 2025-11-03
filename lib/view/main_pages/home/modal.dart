import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/view/custom_widgets/custom_check_box.dart';
import 'package:dodamdodam_fe/view/main_pages/home/card.dart';
import 'package:dodamdodam_fe/view/main_pages/home/modal_quiz_maker.dart';
import 'package:dodamdodam_fe/view/main_pages/home/modal_quiz_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  int _completedQuizzesCount = 0;
  final int _totalQuizzes = 2;

  bool _showCreateQuizForm = false;

  void _onQuizCompleted() {
    setState(() {
      _completedQuizzesCount++;
    });
  }

  void _handleQuizSaved() {
    GoRouter.of(context).pop(true);
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 362,
                height: 43,
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Image.asset(
                    'assets/icons/close.png',
                    width: 23,
                    height: 23,
                  ),
                ),
              ),

              if (_showCreateQuizForm)
                _buildCreateQuizForm()
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/icons/party.svg',
                            width: 28,
                            height: 28,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            '책 완독을 축하해요!',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 7.0),

                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            '채식주의자 책 - 한강 저자 의 문제들이에요',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),

                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 362,
                        height: 214,
                        child: ModalQuizWidget(
                          onQuizCompleted: _onQuizCompleted,
                        ),
                      ),
                    ),

                    if (_completedQuizzesCount == _totalQuizzes)
                      Column(
                        children: [
                          const SizedBox(height: 13.0),
                          _buildCreateQuizForm(),
                        ],
                      ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCreateQuizForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              SvgPicture.asset(
                'assets/icons/magnifier.svg',
                width: 28,
                height: 28,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '방금 제시된 문제는 어땠나요?',
                      style: TextStyle(fontSize: 12, fontFamily: 'Pretendard'),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showCreateQuizForm = !_showCreateQuizForm;
                        });
                      },
                      child: Row(
                        children: [
                          const Text(
                            '새로운 문제들을 직접 제작해보세요!',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 5),
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CustomCheckbox(
                              value: _showCreateQuizForm,
                              iconSize: 18,
                              shape: CheckBoxShape.rectangle,
                              onChanged: (value) {
                                setState(() {
                                  _showCreateQuizForm = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (_showCreateQuizForm)
            ModalQuizMaker(onQuizSaved: _handleQuizSaved),
        ],
      ),
    );
  }
}
