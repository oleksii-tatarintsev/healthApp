import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class ArterialPressureSection extends StatefulWidget {
  const ArterialPressureSection({Key? key}) : super(key: key);

  @override
  State<ArterialPressureSection> createState() =>
      ArterialPressureSectionState();
}

class ArterialPressureSectionState extends State<ArterialPressureSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(
            'Укажите вашу группу крови',
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.artPressure),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 90,
                          child: MCTextField(
                            isTextAlignCenter: true,
                            height: 50,
                            onChanged: (String value) {},
                            inputType: TextInputType.number,
                          ),
                        ),
                        Text(
                          '/',
                          style: MCTextStyles.black20SemiBold600,
                        ),
                        SizedBox(
                          width: 90,
                          child: MCTextField(
                            isTextAlignCenter: true,
                            height: 50,
                            onChanged: (String value) {},
                            inputType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'мм рт ст',
                      style: MCTextStyles.black12Medium500,
                    ),
                  ],
                ),
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
