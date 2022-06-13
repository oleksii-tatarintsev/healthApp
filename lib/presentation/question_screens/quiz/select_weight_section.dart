import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class SelectWeightSection extends StatelessWidget {
  const SelectWeightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            'Укажите ваш вес',
            style: MCTextStyles.black20SemiBold600,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'Эти данные вы можете изменить в любой момент',
              style: MCTextStyles.black14Medium500,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            color: MCColors.white,
            child: SizedBox(
              height: 237,
              width: 337,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeightPicker(
                    quantity: 60,
                    text: 'кг',
                    isVertical: false,
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Image.asset(
                      AppImages.lineHW,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class WeightPicker extends StatefulWidget {
  late double quantity;
  final String text;
  final bool isVertical;

  WeightPicker({
    required this.quantity,
    required this.text,
    required this.isVertical,
    Key? key,
  }) : super(key: key);

  @override
  State<WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  late SliderController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        SliderController(initialMark: widget.quantity, minMark: 0, interval: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.quantity.toInt()}',
                style: MCTextStyles.blue20SemiBold600,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.text,
                style: MCTextStyles.blue12SemiBold600,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            height: 70,
            child: CustomSlider(
              isVertical: widget.isVertical,
              controller: _controller,
              decoration: PointerDecoration(),
              onChanged: (double value) {
                setState(() {
                  widget.quantity = value;
                });
              },
              indicator: Container(
                alignment: Alignment.centerLeft,
                height: 1,
                width: 70,
                color: MCColors.blue,
              ),
            ),
          ),
          // SizedBox(
          //   width: 10,
          // ),
        ],
      ),
    );
  }
}
