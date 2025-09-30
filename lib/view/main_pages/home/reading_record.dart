import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/view/custom_widgets/custom_check_box.dart';
import 'package:dodamdodam_fe/view/main_pages/home/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReadingRecordWidget extends ConsumerStatefulWidget {
  final DateTime date;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onSaved;

  const ReadingRecordWidget({
    required this.date,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    this.margin,
    this.onSaved,
    super.key,
  });

  @override
  ConsumerState<ReadingRecordWidget> createState() =>
      _ReadingRecordWidgetState();
}

class _ReadingRecordWidgetState extends ConsumerState<ReadingRecordWidget> {
  /// index
  /// 0 -> title
  /// 1 -> author
  /// 2 -> publisher
  /// 3 -> thought
  final List<TextEditingController> controllerList = List.generate(
    4,
    (index) => TextEditingController(),
  );

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      constraints: BoxConstraints(
        minWidth: 361,
        maxWidth: 361,
        minHeight: 288,
        maxHeight: 288,
      ),
      padding: widget.padding,
      margin: widget.margin,
      child: Column(
        children: [
          _dayText(),
          _infoBox(),
          _saveButton(onTap: widget.onSaved),
        ],
      ),
    );
  }

  Widget _dayText() {
    return Text(
      DateFormat('yyyy년 MM월 dd일').format(widget.date),
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _infoBox() {
    return Container(
      width: 341,
      height: 176,
      margin: EdgeInsets.symmetric(vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_imgaeUpload(), _inputInfo()],
      ),
    );
  }

  Widget _saveButton({GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 331,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffA9A28A),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '저장하기',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }

  Widget _imgaeUpload() {
    return GestureDetector(
      onTap: () {
        /// TODO:
        /// 이미지 업로드 - 파일 업로드 + 사진 촬영 후 파일 업로드
      },
      child: Container(
        width: 154,
        height: 176,
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(3),
              child: Image.asset('assets/icons/add.png', width: 16, height: 16),
            ),

            Text(
              '사진 업로드',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputInfo() {
    return Container(
      width: 170,
      height: 176,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            controller: controllerList[0],
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
            cursorColor: Color(0xff6C6C6C),
            cursorHeight: 14,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                minWidth: 170,
                maxWidth: 170,
                minHeight: 28,
                maxHeight: 28,
              ),
              hintText: '제목',
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: controllerList[1],
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
                cursorColor: Color(0xff6C6C6C),
                cursorHeight: 14,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    minWidth: 82,
                    maxWidth: 82,
                    minHeight: 28,
                    maxHeight: 28,
                  ),
                  hintText: '저자',
                ),
              ),

              TextFormField(
                controller: controllerList[2],
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
                cursorColor: Color(0xff6C6C6C),
                cursorHeight: 14,
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    minWidth: 82,
                    maxWidth: 82,
                    minHeight: 28,
                    maxHeight: 28,
                  ),
                  hintText: '출판사',
                ),
              ),
            ],
          ),

          TextFormField(
            controller: controllerList[3],
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.start,
            maxLines: 4,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
            cursorColor: Color(0xff6C6C6C),
            cursorHeight: 14,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                minWidth: 170,
                maxWidth: 170,
                minHeight: 67,
                maxHeight: 80,
              ),
              hintText: '감상평',
            ),
          ),

          Container(
            width: 170,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsetsGeometry.symmetric(horizontal: 6),

            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 3),
                  child: CustomCheckbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value;
                      });
                    },
                    iconSize: 18,
                  ),
                ),

                Text(
                  '책을 완독하셧나요?',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
