import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:calendar_flutter_aj/calender_flutter.dart';
import 'package:pic_together/controller/firebase_controller.dart';
import 'package:pic_together/model/appointment.dart';

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
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'PicTogether',
              style: TextStyle(color: Colors.black),
            ),
            leading: GestureDetector(
              onTap: () {
                _showAppointmentPopup(context);
              },
              child: const SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: CalendarFlutterAj(
                  selectedDate: (selectedDate) {
                    setState(() {
                      calenderSelectedDate = selectedDate;
                    });
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
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                // 사진첩 들어가는는 작업 수행
              },
              child: Icon(
                Icons.photo_library,
              ),
              backgroundColor: Color(0xff655DBB),
              tooltip: '사진첩',
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () {
                // 홈 화면으로 이동하는 작업 수행
              },
              child: Icon(
                Icons.home,
              ),
              backgroundColor: Color(0xff655DBB),
              tooltip: '홈 화면',
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () {
                // 친구 추가 화면으로 이동하는 작업 수행
              },
              child: Icon(
                Icons.person_add,
              ),
              backgroundColor: Color(0xff655DBB),
              tooltip: '친구 추가',
            ),
          ],
        ),
      ),
    );
  }

  void _showAppointmentPopup(BuildContext context) {
    String name = '';
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('약속 추가'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Input field for appointment name
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(labelText: '약속 이름'),
              ),
              SizedBox(height: 16),
              // Date picker for appointment date
              ElevatedButton(
                onPressed: () {
                  // Show the date picker when the button is pressed
                  showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then((value) {
                    if (value != null) {
                      // Update the selectedDate with the picked date
                      selectedDate = value;
                    }
                  });
                },
                child: Text('날짜 선택'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Submit button pressed, do your logic here
                if (name.isNotEmpty) {
                  // Execute your logic here with 'name' and 'selectedDate'
                  print('Appointment Name: $name');
                  print('Selected Date: $selectedDate');
                }

                Appointment appointment =
                Appointment.newAppointment(name, selectedDate);

                FirebaseController().sendAppointmentData(appointment);

                // Close the popup
                Navigator.of(context).pop();
              },
              child: Text('추가'),
            ),
            TextButton(
              onPressed: () {
                // Close the popup when the cancel button is pressed
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
          ],
        );
      },
    );
  }
}