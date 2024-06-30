import 'package:flutter/material.dart';

class CalendarDialog extends StatelessWidget {
  const CalendarDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: double.maxFinite,
        child: CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
          lastDate: DateTime(DateTime.now().year + 1),
          onDateChanged: (DateTime value) {
            // Handle the date change
          },
        ),
      ),
    );
  }
}
