import 'package:flutter/material.dart';
import 'package:healthapp/presentation/export.dart';

import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class TellAboutYourself extends StatelessWidget {
  static const routeName = '/tell_about_yourself_screen';
  const TellAboutYourself({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 4,
            ),
            Center(
              child: Image.asset(
                AppImages.question0Image,
                width: MediaQuery.of(context).size.shortestSide * 0.6,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              'Расскажите о себе!',
              style: MCTextStyles.black20SemiBold600,
            ),
            Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 240.0,
              child: Text(
                'Чтобы настроить приложение под вас, нам необходимы данные о вашем здоровье. Заполните небольшую анкету.',
                textAlign: TextAlign.center,
                style: MCTextStyles.black14Medium500,
              ),
            ),
            Spacer(
              flex: 3,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: MCButton(
                buttonText: 'Начать',
                onTap: () {
                  Navigator.pushNamed(context, QuestionScreen.routeName);
                },
                buttonType: ButtonType.blue,
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
