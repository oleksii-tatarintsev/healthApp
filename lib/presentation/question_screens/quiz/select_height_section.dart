import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class SelectHeightSection extends StatefulWidget {
  const SelectHeightSection({Key? key}) : super(key: key);

  @override
  State<SelectHeightSection> createState() => SelectHeightSectionState();
}

class SelectHeightSectionState extends State<SelectHeightSection> {
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
                    text: 'см',
                    isVertical: true,
                    onChanged: (_) {},
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
