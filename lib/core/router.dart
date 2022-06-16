import 'package:flutter/cupertino.dart';
import 'package:healthapp/presentation/export.dart';
import 'package:healthapp/presentation/question_screens/final_question_screen.dart';

class MCRouter {
  static PageRouteBuilder<void> builder(Widget widget, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: Duration(microseconds: 300),
      reverseTransitionDuration: Duration(microseconds: 300),
      pageBuilder: (
        _,
        __,
        ___,
      ) =>
          widget,
      transitionsBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder<void> splashBuilder(
    Widget widget,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: Duration(seconds: 1),
      reverseTransitionDuration: Duration(microseconds: 300),
      pageBuilder: (
        _,
        __,
        ___,
      ) =>
          widget,
      transitionsBuilder: (_, anim, __, child) {
        return FadeTransition(
          opacity: anim,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable, prefer_final_locals
    dynamic data = settings.arguments;
    switch (settings.name) {
      case SplashScreen.routeName:
        {
          return splashBuilder(SplashScreen(), settings);
        }
      case WelcomeScreen.routeName:
        {
          return splashBuilder(WelcomeScreen(), settings);
        }
      case TellAboutYourself.routeName:
        {
          return splashBuilder(TellAboutYourself(), settings);
        }
      case QuestionScreen.routeName:
        {
          return splashBuilder(QuestionScreen(), settings);
        }
      case FinalQuestionScreen.routeName:
        {
          return splashBuilder(FinalQuestionScreen(), settings);
        }
      default:
        return builder(Container(), settings);
    }
  }
}
