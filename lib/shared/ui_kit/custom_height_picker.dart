import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class HeightPicker extends StatefulWidget {
  final String text;
  final bool isVertical;
  final ValueChanged<int>? onChanged;

  const HeightPicker({
    required this.text,
    required this.isVertical,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  final ValueNotifier<double> quantity = ValueNotifier(170);
  late SliderController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SliderController(
      initialMark: quantity.value,
      minMark: 0,
      interval: 1,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          CustomSlider(
            isVertical: widget.isVertical,
            controller: _controller,
            decoration: PointerDecoration(),
            onChanged: (double value) {
              quantity.value = value;
              widget.onChanged?.call(value.toInt());
            },
            indicator: Container(
              alignment: Alignment.centerLeft,
              height: 1,
              width: 70,
              color: MCColors.blue,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ValueListenableBuilder(
            valueListenable: quantity,
            builder: (BuildContext context, double value, Widget? child) {
              return SizedBox(
                width: 40,
                child: Text(
                  '${value.toInt()}',
                  style: MCTextStyles.blue20SemiBold600,
                ),
              );
            },
          ),
          Text(
            widget.text,
            style: MCTextStyles.blue12SemiBold600,
          ),
        ],
      ),
    );
  }
}
