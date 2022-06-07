import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthapp/shared/style/export.dart';

class BodyMassIndex extends StatefulWidget {
  final double outerHorizontalPadding;
  final double bodyMassIndex;

  const BodyMassIndex({
    required this.bodyMassIndex,
    required this.outerHorizontalPadding,
    Key? key,
  }) : super(key: key);

  @override
  BodyMassIndexState createState() => BodyMassIndexState();
}

class BodyMassIndexState extends State<BodyMassIndex> {
  late final double oneDivisionPercentWidth;
  late final String bmiDescription;
  final double innerHorizontalPadding = 9;
  final int bmiMinValue = 16;
  final int bmiMaxValue = 40;
  double bmiWidth = 0;

  @override
  void initState() {
    oneDivisionPercentWidth = 1 / (bmiMaxValue - bmiMinValue);
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        setState(() {
          bmiWidth = MediaQuery.of(context).size.width -
              widget.outerHorizontalPadding * 2 -
              innerHorizontalPadding * 2;
        });
      },
    );
  }

  String _getBmiDescription() {
    final double value = widget.bodyMassIndex;
    if (value < 18.5) {
      return 'У вас недостаток веса';
    } else if (value >= 18.5 && value < 25) {
      return 'Ваш индекс массы тела соответствует норме';
    } else if (value >= 25 && value < 30) {
      return 'У вас избыточный вес';
    } else if (value >= 30 && value < 35) {
      return 'У вас ожирение I степени';
    } else if (value >= 35 && value < 40) {
      return 'У вас ожирение II степени';
    } else if (value >= 40) {
      return 'У вас ожирение III степени';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        color: MCColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ИМТ',
                  style: MCTextStyles.black16SemiBold600,
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      '${widget.bodyMassIndex.toString()} ',
                      style: MCTextStyles.black20SemiBold600
                          .copyWith(color: MCColors.blue),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30.0, bottom: 17.0),
            child: Text(
              _getBmiDescription(),
              style: MCTextStyles.black12Medium500,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              labelPadding(),
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/icons/label.svg'),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      widget.bodyMassIndex.toString(),
                      style: MCTextStyles.blue12SemiBold600
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: innerHorizontalPadding),
            width: double.infinity,
            height: 20.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [
                  0,
                  0.07,
                  0.28,
                  0.51,
                  0.7,
                  0.88,
                  1,
                ],
                colors: [
                  Color(0xff60B2FF),
                  Color(0xff57D7FF),
                  Color(0xff7CFF79),
                  Color(0xffFFD772),
                  Color(0xffFFD772),
                  Color(0xffF05C5F),
                  Color(0xffB4191C),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: innerHorizontalPadding),
            child: Row(
              children: [
                Text(
                  '<$bmiMinValue',
                  style: MCTextStyles.black12Medium500,
                ),
                percentSizeBox(1),
                Text(
                  '18,5',
                  style: MCTextStyles.black12Medium500,
                ),
                percentSizeBox(5),
                Text(
                  '25',
                  style: MCTextStyles.black12Medium500,
                ),
                percentSizeBox(4),
                Text(
                  '30',
                  style: MCTextStyles.black12Medium500,
                ),
                percentSizeBox(4),
                Text(
                  '35',
                  style: MCTextStyles.black12Medium500,
                ),
                Spacer(),
                Text(
                  '$bmiMaxValue>',
                  style: MCTextStyles.black12Medium500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget labelPadding() {
    if (widget.bodyMassIndex > bmiMaxValue - 3) {
      return Spacer();
    } else if (widget.bodyMassIndex <= bmiMinValue) {
      return SizedBox.shrink();
    } else {
      final double divisionsDiff = widget.bodyMassIndex - bmiMinValue;
      final double width = bmiWidth * (divisionsDiff * oneDivisionPercentWidth);

      return SizedBox(width: width);
    }
  }

  SizedBox percentSizeBox(int divisions) {
    return SizedBox(width: bmiWidth * (oneDivisionPercentWidth * divisions));
  }
}
