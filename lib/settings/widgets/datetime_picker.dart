import 'package:challenge/utils/date_helper.dart.dart';
import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  final DateTime dateTime;
  final ValueChanged<DateTime> onChanged;

  const DateTimePicker({
    Key? key,
    required this.dateTime,
    required this.onChanged,
  }) : super(key: key);

  @override
  DateTimePickerState createState() => DateTimePickerState();
}

class DateTimePickerState extends State<DateTimePicker> {
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = widget.dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final newDateTime = await showDatePicker(
          context: context,
          initialDate: _dateTime,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (newDateTime != null) {
          setState(() {
            _dateTime = newDateTime;
            widget.onChanged(_dateTime);
          });
        }
      },
      child: Text(
        _dateTime.toDateOnly(),
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
