import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';

class CustomRadioDemo extends StatefulWidget {
  final String title1;
  final String title2;
  const CustomRadioDemo({
    required this.title1,
    required this.title2,
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _CustomRadioDemoState();
}

class _CustomRadioDemoState extends State<CustomRadioDemo> {
  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyRadioOption<String>(
          value: '1',
          groupValue: _groupValue,
          onChanged: _valueChangedHandler(),
          text: widget.title1,
        ),
        MyRadioOption<String>(
          value: '2',
          groupValue: _groupValue,
          onChanged: _valueChangedHandler(),
          text: widget.title2,
        ),
      ],
    );
  }
}

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;

  final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.text,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 24,
      height: 24,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: MCColors.lightGrey,
          ),
        ),
      ),
      child: Visibility(
        visible: isSelected,
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: MCColors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(45),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      text,
      style: MCTextStyles.black12Medium500,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              _buildLabel(),
              const SizedBox(width: 10),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }
}
