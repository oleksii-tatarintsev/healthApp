import 'package:flutter/cupertino.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final ValueChanged<DateTime>? onChanged;
  const CustomDatePicker({
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateFormat date;
  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    date = DateFormat.yMMMd('ru');
  }

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
      onPressed: () => _showDialog(
        CupertinoDatePicker(
          maximumYear: DateTime.now().year,
          initialDateTime: DateTime.now(),
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          onDateTimeChanged: (DateTime newDate) {
            setState(() => dateTime = newDate);
            widget.onChanged?.call(dateTime!);
          },
        ),
      ),
      child: Text(
        dateTime == null ? '___' : date.format(dateTime!),
        style: MCTextStyles.blue14Bold700,
      ),
    );
  }
}
