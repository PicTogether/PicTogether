import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar_flutter_aj/calender_flutter.dart';

void main() {
  runApp(const MainView());
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  DateTime? calenderSelectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calender Flutter AJ',
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CalendarFlutterAj(
              selectedDate: (selectedDate) {
                calenderSelectedDate = selectedDate;
                if (kDebugMode) {
                  print(selectedDate);
                }
              },
              backArrow: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  //shape : BoxShape.circle,
                ),
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              forwardArrow: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  //shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              calenderBackgroundColor: Colors.white,
              //showCalenderGradient: true,
              //showMonthGradient: true,
              //showYearGradient: true,
              dividerColor: Colors.white,
              selectedDayColor: Colors.white,
              selectedDayWidget: Text(
                calenderSelectedDate!.day.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              calenderSelectedDateBackgroundcolor: Color(0xff655DBB),
              showCalenderSelectedDateBackgroundcolor: true,
              calenderSelectedDateColor: Colors.white,
              calenderSelectedDateFontSize: 18,
              calenderSelectedDateBorderRadius: BorderRadius.circular(50),
              dayTextStyle: const TextStyle(
                color: Colors.black,
              ),
              monthBackgroundColor: Colors.black,
              monthTextStyle: const TextStyle(
                color: Colors.black,
              ),
              weekdaysTextStyle: const TextStyle(
                color: Colors.black,
              ),
              yearBackgroundColor: Colors.black,
              yearTextStyle: const TextStyle(
                color: Colors.black,
              ),
              calenderUnSelectedDatesColor: Colors.black,
              yearPopHeadingText: "year",
              yearPopHeadingTextStyle: const TextStyle(
                color: Colors.black,
              ),
              yearsListTextStyle: const TextStyle(
                color: Colors.black,
              ),
              monthPopHeadingText: "month",
              monthPopHeadingTextStyle: const TextStyle(
                color: Colors.black,
              ),
              monthsListTextStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}