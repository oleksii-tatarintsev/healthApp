import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healthapp/presentation/export.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class FinalQuestionScreen extends StatelessWidget {
  static const routeName = '/final_question';

  const FinalQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
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
            Spacer(
              flex: 1,
            ),
            Center(
              child: Image.asset(
                AppImages.finalQuiz,
                width: MediaQuery.of(context).size.shortestSide * 0.7,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              'Поздравляем,\n вы заполнили профиль!',
              style: MCTextStyles.black20SemiBold600,
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 315,
              child: Text(
                'Начните отслеживать состояние вашего здоровья: добавляйте, сохраняйте и систематизируйте медицинские данные',
                textAlign: TextAlign.center,
                style: MCTextStyles.black14Medium500,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MCButton(
                buttonText: 'Начать',
                onTap: () {},
                buttonType: ButtonType.blue,
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
    );
  }
}
