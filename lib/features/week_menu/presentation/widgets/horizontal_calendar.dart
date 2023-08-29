import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({Key? key}) : super(key: key);

  @override
  HorizontalCalendarState createState() => HorizontalCalendarState();
}

class HorizontalCalendarState extends State<HorizontalCalendar> {
  late DateTime _selectedDate;
  late DateFormat _dateFormat;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _dateFormat = DateFormat('EEE, MMM d');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final date = _selectedDate.add(Duration(days: index));
          final formattedDate = _dateFormat.format(date);
          final isSelected = index == 0;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  formattedDate,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
