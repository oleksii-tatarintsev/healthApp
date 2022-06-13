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
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: SvgPicture.asset(AppIcons.backIcon),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
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
            /* if(){
            PersonDataSection()
            }else if(){
            AddPhotoSection()
            } else if(){
            SelectHeightSection(),
            }else if(){
            SelectWeightSection(),
            }*/
            SelectWeightSection(),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: MCButton(
                buttonText: 'Далее',
                onTap: () {},
                buttonType: ButtonType.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


