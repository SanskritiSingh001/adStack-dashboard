import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../constants/app_colors.dart';

// Small calendar card shown in the right panel.
// Made it a StatefulWidget because table_calendar needs to keep
// track of the focused day and selected day.
class CalendarCard extends StatefulWidget {
  const CalendarCard({super.key});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "GENERAL 10:00 AM TO 7:00 PM",
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textGrey,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          TableCalendar(
            firstDay: DateTime.utc(2015, 1, 1),
            lastDay: DateTime.utc(2035, 12, 31),
            focusedDay: focusedDay,
            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            onDaySelected: (selected, focused) {
              setState(() {
                selectedDay = selected;
                focusedDay = focused;
              });
            },
            daysOfWeekHeight: 20,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: false,
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
              leftChevronIcon: const Icon(Icons.chevron_left,
                  size: 18, color: AppColors.textGrey),
              rightChevronIcon: const Icon(Icons.chevron_right,
                  size: 18, color: AppColors.textGrey),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: GoogleFonts.poppins(
                fontSize: 10,
                color: AppColors.textGrey,
              ),
              weekendStyle: GoogleFonts.poppins(
                fontSize: 10,
                color: AppColors.textGrey,
              ),
            ),
            calendarStyle: CalendarStyle(
              defaultTextStyle: GoogleFonts.poppins(fontSize: 11),
              weekendTextStyle: GoogleFonts.poppins(fontSize: 11),
              todayDecoration: const BoxDecoration(
                color: AppColors.purpleDark,
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: AppColors.purple,
                shape: BoxShape.circle,
              ),
              cellMargin: const EdgeInsets.all(4),
            ),
          ),
        ],
      ),
    );
  }
}
