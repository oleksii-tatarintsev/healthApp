import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthapp/presentation/export.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class QuestionScreen extends StatelessWidget {
  static const routeName = '/question_screen';
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(AppIcons.backIcon),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Пропустить шаг',
                    style: MCTextStyles.blue14Bold700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Text(
              '1/7',
              style: MCTextStyles.grey12Medium500,
            ),
            Container(
              height: 4,
              width: 255,
              decoration: BoxDecoration(
                color: MCColors.lightGrey,
              ),
            ),
            SizedBox(height: 60),
            ///quiz section
            ///1
            PersonDataSection(),
            ///2
            //AddPhotoSection(),
            ///3
            //SelectHeightSection(),
            ///4
            //SelectWeightSection(),
            ///5
            //SelectBloodTypeSection(),
            ///6
            //ArterialPressureSection(),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: MCButton(
                buttonText: 'Далее',
                onTap: () {
                  Navigator.pushNamed(context, FinalQuestionScreen.routeName);
                },
                buttonType: ButtonType.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
