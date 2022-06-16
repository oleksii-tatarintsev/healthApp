import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class SelectHeightSection extends StatelessWidget {
  const SelectHeightSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            'Укажите ваш рост',
            style: MCTextStyles.black20SemiBold600,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
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
              height: 305,
              width: 280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    AppImages.manHeight,
                    height: 70,
                    width: 30,
                  ),
                  Image.asset(
                    AppImages.lineHW,
                    height: 200,
                  ),
                  HeightPicker(
                    quantity: 170,
                    text: 'см',
                    isVertical: true,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class HeightPicker extends StatefulWidget {
  late double quantity;
  final String text;
  final bool isVertical;

  HeightPicker({
    required this.quantity,
    required this.text,
    required this.isVertical,
    Key? key,
  }) : super(key: key);

  @override
  State<HeightPicker> createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  late SliderController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SliderController(
      initialMark: widget.quantity,
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
          SizedBox(
            width: 10,
          ),
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
    );
  }
}
