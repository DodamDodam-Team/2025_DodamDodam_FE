import 'package:dodamdodam_fe/view/main_pages/home/calendar.dart';
import 'package:dodamdodam_fe/view/main_pages/home/reading_rate_announce.dart';
import 'package:dodamdodam_fe/view/main_pages/home/reading_record_widget.dart';
import 'package:dodamdodam_fe/view/main_pages/home/user_reading_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserReadingInfoBox(margin: EdgeInsets.only(bottom: 12)),
          CustomCalendar(
            margin: EdgeInsets.symmetric(vertical: 12),
            onSelected: (value) {
              setState(() {
                _selectedDate = value;
              });
            },
          ),
          _selectedDate == null
              ? ReadingRateAnnounceBox(
                  margin: EdgeInsets.symmetric(vertical: 12),
                )
              : ReadingRecordWidget(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  date: _selectedDate!,
                  onSaved: () {
                    GoRouter.of(context).push('/quiz');
                  },
                ),
        ],
      ),
    );
          ElevatedButton(
            onPressed: () async {
              final result = await GoRouter.of(context).push<bool>('/quiz');
              if (result == true && context.mounted) {
                _showCompletionDialog(context);
              }
            },
            child: Text('Popup'),
          ),
        ],
      ),
    );
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/party.svg', width: 87, height: 87),
              const SizedBox(height: 11),
              const Text(
                '문제가 성공적으로 제작됐어요!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pretendard',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    });
  }
}
