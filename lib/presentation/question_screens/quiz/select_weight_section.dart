import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class SelectWeightSection extends StatefulWidget {
  const SelectWeightSection({Key? key}) : super(key: key);

  @override
  State<SelectWeightSection> createState() => SelectWeightSectionState();
}

class SelectWeightSectionState extends State<SelectWeightSection> {
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
              height: 237,
              width: 337,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeightPicker(
                    text: 'кг',
                    isVertical: false,
                    onChanged: (int value) {},
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
