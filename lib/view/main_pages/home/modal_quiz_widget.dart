import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dodamdodam_fe/config/constants.dart';

class ModalQuizWidget extends ConsumerStatefulWidget {
  final VoidCallback onQuizCompleted;

  const ModalQuizWidget({super.key, required this.onQuizCompleted});

  @override
  ConsumerState<ModalQuizWidget> createState() => _ModalQuizWidgetState();
}

class _ModalQuizWidgetState extends ConsumerState<ModalQuizWidget> {
  final List<Map<String, dynamic>> quizzes = [
    {
      'type': 'multiple_choice',
      'question': 'Q. 채식주의자의 주인공 영혜가 채식을 시작하게 된 가장 큰 계기는 무엇인가?',
      'options': [
        '1. 남편의 권유',
        '2. 채식 관련 책을 읽고 감동을 받아서',
        '3. 꿈속의 끔찍한 장면 때문',
        '4. 건강상의 이유',
      ],
      'correctAnswer': 2,
      //정답 3번
    },
    {
      'type': 'ox_quiz',
      'question': 'Q. 영혜의 시점만으로 이야기가 진행된다.',
      'options': ['O', 'X'],
      'correctAnswer': 'X',
    },
  ];

  final List<bool> _quizCompletionStatus = List.generate(
    2,
    (index) => false,
  ); // 퀴즈 수에 맞게 초기화

  // 각 퀴즈 카드의 상태를 관리하고 부모에게 알리는 함수
  void _notifyQuizCompletion(int index) {
    if (!_quizCompletionStatus[index]) {
      _quizCompletionStatus[index] = true;
      widget.onQuizCompleted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: quizzes.asMap().entries.map((entry) {
          final index = entry.key;
          final quiz = entry.value;

          Widget quizCard;
          if (quiz['type'] == 'multiple_choice') {
            quizCard = MultipleChoiceQuizCard(
              question: quiz['question'] as String,
              options: quiz['options'] as List<String>,
              correctIndex: 2,
              onQuizAnswered: () => _notifyQuizCompletion(index),
            );
          } else if (quiz['type'] == 'ox_quiz') {
            quizCard = OXQuizcard(
              question: quiz['question'] as String,
              options: quiz['options'] as List<String>,
              correctAnswer: quiz['correctAnswer'] as String,
              onQuizAnswered: () => _notifyQuizCompletion(index),
            );
          } else {
            quizCard = Container();
          }
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: SizedBox(width: 215, child: quizCard),
          );
        }).toList(),
      ),
    );
  }
}

class MultipleChoiceQuizCard extends StatefulWidget {
  final String question;
  final List<String> options;
  final int correctIndex;
  final VoidCallback onQuizAnswered;

  const MultipleChoiceQuizCard({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.onQuizAnswered,
    super.key,
  });

  @override
  State<MultipleChoiceQuizCard> createState() => _MultipleChoiceQuizCardState();
}

class _MultipleChoiceQuizCardState extends State<MultipleChoiceQuizCard> {
  int? _selectedIndex;
  bool _isAnswered = false;

  Color _getOptionColor(int index) {
    if (!_isAnswered) {
      return AppColors.background;
    }
    if (index == widget.correctIndex) {
      return AppColors.correctAnswer;
    }
    if (_selectedIndex == index && _selectedIndex != widget.correctIndex) {
      return AppColors.wrongAnswer;
    }

    return AppColors.background;
  }

  Color _getOptionBorderColor(int index) {
    if (!_isAnswered) {
      return AppColors.background; // 기본 테두리 색상
    }

    // 내가 선택한 답인 경우
    if (_selectedIndex == index) {
      return _selectedIndex == widget.correctIndex
          ? AppColors.correctAnswerBorder
          : AppColors.wrongAnswer;
    }

    if (index == widget.correctIndex) {
      return AppColors.correctAnswer;
    }

    return AppColors.background;
  }

  void _selectOption(int index) {
    if (_isAnswered) return; //이미 풀었으면 무시

    setState(() {
      _selectedIndex = index;
      _isAnswered = true; // 퀴즈 푼것으로 처리
      widget.onQuizAnswered();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.onBoardingBackground, // 카드 배경색
        borderRadius: BorderRadius.circular(8), // 카드 모서리 둥글게
      ),
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pretendard',
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: widget.options.asMap().entries.map((entry) {
                  int index = entry.key;
                  String optionText = entry.value;

                  return GestureDetector(
                    onTap: () => _selectOption(index),
                    child: QuizOptionButton(
                      text: optionText,
                      color: _getOptionColor(index),
                      isSelected: _selectedIndex == index,
                      borderColor: _getOptionBorderColor(index),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizOptionButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool isSelected;
  final Color borderColor;

  const QuizOptionButton({
    required this.text,
    required this.color,
    this.isSelected = false,
    required this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, fontFamily: 'Pretendard'),
        ),
      ),
    );
  }
}

class OXQuizcard extends StatefulWidget {
  final String question;
  final String correctAnswer;
  final List<String> options;
  final VoidCallback onQuizAnswered;

  const OXQuizcard({
    required this.question,
    required this.correctAnswer,
    required this.options,
    required this.onQuizAnswered,
    super.key,
  });

  @override
  State<OXQuizcard> createState() => _OXQuizcardState();
}

class _OXQuizcardState extends State<OXQuizcard> {
  String? _selectedAnswer;
  bool _isAnswered = false;

  void _selectAnswer(String answer) {
    if (_isAnswered) return;

    setState(() {
      _selectedAnswer = answer;
      _isAnswered = true;
      widget.onQuizAnswered();
    });
  }

  Color _getCircleColor(String answer) {
    if (!_isAnswered) {
      return AppColors.background;
    }
    if (answer == widget.correctAnswer) {
      return AppColors.correctAnswer;
    }

    if (_selectedAnswer == answer && _selectedAnswer != widget.correctAnswer) {
      return AppColors.wrongAnswer;
    }

    return AppColors.background;
  }

  Color _getBorderColor(String answer) {
    if (!_isAnswered) {
      return AppColors.background; // 기본 테두리 색상
    }

    // 내가 선택한 답인 경우
    if (_selectedAnswer == answer) {
      return _selectedAnswer == widget.correctAnswer
          ? AppColors.correctAnswerBorder
          : AppColors.wrongAnswer;
    }

    if (answer == widget.correctAnswer) {
      return AppColors.correctAnswer;
    }

    return AppColors.background;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.onBoardingBackground,
        borderRadius: BorderRadius.circular(8),
      ), // 흰색 배경
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Wrap(
              spacing: 10.0,
              alignment: WrapAlignment.start,
              children: widget.options.map((answer) {
                return GestureDetector(
                  onTap: () => _selectAnswer(answer),
                  child: SizedBox(
                    width: 90,
                    height: 105,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _getCircleColor(answer),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _getBorderColor(answer),
                          width: 3.0,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        answer,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
