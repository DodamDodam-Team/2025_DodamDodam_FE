import 'package:flutter/material.dart';
import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/view/custom_widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class ModalQuizMaker extends StatefulWidget {
  final VoidCallback onQuizSaved;
  const ModalQuizMaker({super.key, required this.onQuizSaved});

  @override
  State<ModalQuizMaker> createState() => _ModalQuizMakerState();
}

class _ModalQuizMakerState extends State<ModalQuizMaker> {
  String _selectedQuizType = '객관식';
  int _correctAnswerIndex = -1;

  late TextEditingController _questionController;
  late List<TextEditingController> _optionControllers;

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController();
    _setupOptionControllers(isOX: false);
  }

  void _setupOptionControllers({required bool isOX}) {
    _optionControllers = List.generate(isOX ? 2 : 4, (index) {
      if (isOX) {
        return TextEditingController(text: index == 0 ? 'O' : 'X');
      }
      return TextEditingController();
    });
  }

  @override
  void dispose() {
    _questionController.dispose();
    for (var controller in _optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleQuizTypeChange(String? newValue) {
    if (newValue == null) return;
    setState(() {
      _selectedQuizType = newValue;
      _correctAnswerIndex = -1; //
      _setupOptionControllers(isOX: newValue == 'OX');
    });
  }

  void _selectCorrectAnswer(int index) {
    setState(() {
      if (_correctAnswerIndex == index) {
        _correctAnswerIndex = -1; //
      } else {
        _correctAnswerIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isOX = _selectedQuizType == 'OX';

    return Container(
      width: 361,
      //height: 264,
      padding: const EdgeInsets.only(
        left: 12.0,
        top: 18.0,
        right: 12.0,
        bottom: 18.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.onBoardingBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildQuizTextField(
                  controller: _questionController,
                  hintText: 'Q. 문제 이름',
                ),
              ),
              const SizedBox(width: 6),
              _buildDropdown(),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(color: AppColors.background, thickness: 1.0),
          const SizedBox(height: 5),
          Column(
            children: List.generate(
              isOX ? 2 : 4,
              (index) => _buildOptionRow(
                index: index,
                isCorrect: _correctAnswerIndex == index,
                isOX: isOX,
              ),
            ),
          ),
          const SizedBox(height: 13),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      width: 91,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedQuizType,
          icon: Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black),
          items: ['객관식', 'OX'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: Text(
                  value,
                  style: TextStyle(fontSize: 12, fontFamily: 'Pretendard'),
                ),
              ),
            );
          }).toList(),
          onChanged: _handleQuizTypeChange,
        ),
      ),
    );
  }

  Widget _buildOptionRow({
    required int index,
    required bool isCorrect,
    required bool isOX,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _selectCorrectAnswer(index),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: isCorrect
                        ? AppColors.primary
                        : AppColors.onBoardingBackground,
                    width: 1.5,
                  ),
                ),
                child: _buildQuizTextField(
                  controller: _optionControllers[index],
                  hintText: isOX ? '' : '${index + 1}. 답변 등록',
                  readOnly: isOX,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 20,
            height: 20,
            child: CustomCheckbox(
              value: isCorrect,
              iconSize: 20,
              shape: CheckBoxShape.rectangle,
              onChanged: (value) {
                _selectCorrectAnswer(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizTextField({
    required TextEditingController controller,
    required String hintText,
    bool readOnly = false,
  }) {
    return SizedBox(
      width: 290,
      height: 28,
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: AppColors.background,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 7.0,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return GestureDetector(
      onTap: () {
        print('Question: ${_questionController.text}');
        print('Type: $_selectedQuizType');
        print('Correct Answer Index: $_correctAnswerIndex');
        for (var i = 0; i < _optionControllers.length; i++) {
          print('Option $i: ${_optionControllers[i].text}');
        }
        widget.onQuizSaved();
      },
      child: Container(
        width: 337,
        height: 30,

        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            '저장하기',
            style: TextStyle(
              color: AppColors.background,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
