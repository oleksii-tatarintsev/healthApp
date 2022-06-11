import 'package:flutter/cupertino.dart';
import 'package:healthapp/shared/style/export.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime date = DateTime(2016, 10, 26);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      // Display a CupertinoDatePicker in date picker mode.
      onPressed: () => _showDialog(
        CupertinoDatePicker(
          initialDateTime: date,
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          // This is called when the user changes the date.
          onDateTimeChanged: (DateTime newDate) {
            setState(() => date = newDate);
          },
        ),
      ),

      child: Text(
        '${date.day} ${date.month} ${date.year}',
        style: MCTextStyles.blue14Bold700,
      ),
    );
  }
}