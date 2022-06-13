import 'package:flutter/cupertino.dart';
import 'package:healthapp/shared/style/export.dart';

class PointerDecoration {
  final double width;
  final double height;
  final Color degreeColor;

  const PointerDecoration({
    this.width = 70,
    this.height = 1,
    this.degreeColor = MCColors.lightGrey,
  });
}

class ContainerPointer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const ContainerPointer({
    Key? key,
    this.width = 70.0,
    this.height = 1.0,
    this.color = MCColors.lightGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: color,
      ),
    );
  }
}

class SliderController extends FixedExtentScrollController {
  final double initialMark;
  final int minMark;
  final double itemExtent;
  final double interval;

  SliderController({
    this.initialMark = 0.0,
    this.minMark = 0,
    this.itemExtent = 10.0,
    double interval = 1.0,
  })  : interval = 1 * (1 / interval),
        assert(minMark >= 0),
        assert(itemExtent >= 0),
        assert(interval <= 1.0),
        super(
          initialItem: ((initialMark - minMark) * (1 * (1 / interval))).toInt(),
        );

  int getIntervalToInt() => interval.toInt();

  @override
  void jumpToItem(int itemIndex) {
    super.jumpToItem((itemIndex - minMark) * getIntervalToInt());
  }

  @override
  void jumpTo(double value) {
    super.jumpTo((itemExtent * (value - minMark)) * interval);
  }
}

class CustomSlider extends StatelessWidget {
  final SliderController controller;
  final int maxMark;
  final PointerDecoration decoration;
  final Widget? indicator;
  final ValueChanged<double> onChanged;
  final bool isVertical;

  const CustomSlider({
    required this.controller,
    required this.onChanged,
    this.maxMark = 300,
    this.decoration = const PointerDecoration(),
    this.indicator,
    this.isVertical = true,
    Key? key,
  })  : assert(maxMark >= 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 70,
      child: RotatedBox(
        quarterTurns: isVertical ? 0 : 3,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            CupertinoPicker(
              itemExtent: controller.itemExtent,
              diameterRatio: 1000,
              scrollController: controller,
              magnification: 0.1,
              squeeze: 1.1,
              children: List<Widget>.generate(
                [
                  for (int i =
                          controller.minMark * controller.getIntervalToInt();
                      i <= maxMark * controller.getIntervalToInt();
                      i++)
                    i,
                ].length,
                (index) => Align(
                  alignment: Alignment.centerLeft,
                  child: index % 5 == 0
                      ? ContainerPointer(
                          color: decoration.degreeColor,
                          width: decoration.width - 20,
                        )
                      : ContainerPointer(
                          color: decoration.degreeColor,
                          width: decoration.width - 30,
                        ),
                ),
              ),
              onSelectedItemChanged: (index) {
                onChanged((index / controller.getIntervalToInt()) +
                    controller.minMark);
              },
            ),
            indicator ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
