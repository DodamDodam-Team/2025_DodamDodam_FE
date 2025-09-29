import 'package:dodamdodam_fe/config/constants.dart';
import 'package:dodamdodam_fe/view/main_pages/home/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends ConsumerStatefulWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomCalendar({
    this.padding = const EdgeInsets.symmetric(vertical: 22.5, horizontal: 8),
    this.margin,
    super.key,
  });

  @override
  ConsumerState<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends ConsumerState<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: widget.padding,
      margin: widget.margin,
      child: TableCalendar(
        locale: 'ko_KR',
        calendarFormat: CalendarFormat.month,

        headerStyle: HeaderStyle(
          headerMargin: EdgeInsets.zero,
          headerPadding: EdgeInsets.zero,

          formatButtonVisible: false,

          titleCentered: false,
          titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),

          leftChevronIcon: Image.asset(
            'assets/icons/left_chevron.png',
            width: 22.5,
            height: 22.5,
          ),
          leftChevronMargin: EdgeInsets.zero,

          rightChevronIcon: Image.asset(
            'assets/icons/right_chevron.png',
            width: 22.5,
            height: 22.5,
          ),
          rightChevronMargin: EdgeInsets.zero,
        ),

        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),

          weekendStyle: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),

        daysOfWeekHeight: 40,

        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),

        availableGestures: AvailableGestures.all,

        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = selectedDay;
          });
        },

        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },

        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) =>
              _calendarNode(day, false),

          selectedBuilder: (context, day, focusedDay) =>
              _calendarNode(day, true),

          todayBuilder: (context, day, focusedDay) =>
              (day.month == focusedDay.month)
              ? _calendarNode(day, false)
              : _outsideNode(day),

          outsideBuilder: (context, day, focusedDay) => _outsideNode(day),
        ),
      ),
    );
  }

  Widget _calendarNode(DateTime day, bool isSelected) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant,
        borderRadius: BorderRadius.circular(9.75),
      ),
      child: Stack(
        children: [
          //Image.file(File('path')),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, isSelected ? 0.15 : 0),
              borderRadius: BorderRadius.circular(9.75),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            child: Text(
              '${day.day}',
              style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontSize: 9.75,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _outsideNode(DateTime day) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.75)),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      alignment: Alignment.topLeft,
      child: Text(
        '${day.day}',
        style: TextStyle(
          color: Color(0xff989898),
          fontWeight: FontWeight.w400,
          fontSize: 9.75,
        ),
      ),
    );
  }
}
