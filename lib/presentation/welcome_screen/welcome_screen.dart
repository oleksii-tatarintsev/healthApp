import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

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
                AppImages.welcomeImage,
                width: MediaQuery.of(context).size.shortestSide * 0.6,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Text(
              'Приветствуем!',
              style: MCTextStyles.black20SemiBold600,
            ),
            Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 240.0,
              child: Text(
                'Сохраняйте все свои данные о здоровье в одном приложении',
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
                onTap: () {},
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
