import 'package:dodamdodam_fe/view/main_pages/home/calendar.dart';
import 'package:dodamdodam_fe/view/main_pages/home/reading_rate_announce.dart';
import 'package:dodamdodam_fe/view/main_pages/home/reading_record_widget.dart';
import 'package:dodamdodam_fe/view/main_pages/home/user_reading_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  }
}
