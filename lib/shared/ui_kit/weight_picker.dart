import 'package:flutter/cupertino.dart';
import 'package:healthapp/shared/style/export.dart';

class MCGWeightPicker extends StatelessWidget {
  final ValueChanged<int> onSelectedItemChanged;
  final int weight;

  MCGWeightPicker({
    required this.onSelectedItemChanged,
    required this.weight,
    Key? key,
  }) : super(key: key);

  final List<Align> data = List.generate(
    250,
    (index) {
      if (index % 10 == 0) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: MCColors.grey,
            width: 100.0,
            height: 1.0,
          ),
        );
      } else if (index % 5 == 0) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: MCColors.grey,
            width: 60.0,
            height: 1.0,
          ),
        );
      } else {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: MCColors.grey,
            width: 40.0,
            height: 1.0,
          ),
        );
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 300.0,
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: MCColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$weight кг',
            style:
                MCTextStyles.black20SemiBold600.copyWith(color: MCColors.blue),
          ),
          Image.asset(
            'assets/images/arrow_horizontal.png',
            width: 150,
            color: MCColors.grey,
          ),
          Container(
            width: 140.0,
            height: 200.0,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Transform.rotate(
              angle: -1.58,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(initialItem: 40),
                squeeze: 0.2,
                diameterRatio: 10,
                magnification: 1.0,
                itemExtent: 2,
                onSelectedItemChanged: onSelectedItemChanged,
                children: data,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
