import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/domain/bloc/splash_bloc/splash_bloc.dart';
import 'package:healthapp/presentation/export.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// TODO: Домашка
    /// Почитай что такое BlocConsumer и BlocListener
    return BlocConsumer<SplashBloc, SplashState>(
      builder: (BuildContext context, SplashState state) {
        return Container(
          alignment: Alignment.center,
          color: MCColors.blue,
          child: Lottie.asset(
            'assets/jsons/splash_anim.json',
          ),
        );
      },
      listener: (BuildContext context, SplashState state) {
        state.map(
          initial: (_) {},
          wizardState: (_) {
            //TODO: Тут переходим в регистрацию если пользователя вообще нет
            Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
          },
          authorized: (_) {
            //TODO: Тут перейдем на главную страницу если пользователь авторизировался
          },
          splashUnauthorized: (_) {
            //TODO: Тут перейдем на страницу входа (пин-кода) если пользовател не авторизировался
          },
        );
      },
    );
  }
}
