import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthapp/shared/style/export.dart';

class MCGrowthPicker extends StatelessWidget {
  final ValueChanged<int> onSelectedItemChanged;
  final int height;

  MCGrowthPicker({
    required this.onSelectedItemChanged,
    required this.height,
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
      height: 200.0,
      padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: MCColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.manHeight),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/picker_arrow.png',
              height: 150,
              color: MCColors.grey,
            ),
          ),
          Container(
            width: 130.0,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: 100),
              squeeze: 0.2,
              diameterRatio: 10,
              magnification: 1.0,
              itemExtent: 2,
              onSelectedItemChanged: onSelectedItemChanged,
              children: data,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          SizedBox(
            width: 83.0,
            child: Text(
              '$height см',
              style: MCTextStyles.black20SemiBold600
                  .copyWith(color: MCColors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
