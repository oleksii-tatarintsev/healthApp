import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthapp/domain/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:healthapp/presentation/export.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class QuestionScreen extends StatelessWidget {
  static const routeName = '/question_screen';
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool select = false;
    double width = 36;

    return BlocProvider<QuizBloc>(
      create: (BuildContext context) => QuizBloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (BuildContext context, state) {
              return Column(
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
                          context
                              .read<QuizBloc>()
                              .add(QuizEvent.move(index: state.index - 1));
                          if (state.index == 0) {
                            Navigator.pop(
                              context,
                            );
                          }
                        },
                      ),
                      if (state.index == 0)
                        SizedBox()
                      else
                        TextButton(
                          onPressed: () {
                            context.read<QuizBloc>().add(
                                  QuizEvent.move(index: state.index + 1),
                                );
                            if (state.index >= 5) {
                              Navigator.pushNamed(
                                context,
                                FinalQuestionScreen.routeName,
                              );
                            }
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
                    '${(state.index + 1).toString()}/6',
                    style: MCTextStyles.grey12Medium500,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 4,
                        width: 255,
                        decoration: BoxDecoration(
                          color: MCColors.lightGrey,
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: 4,
                        width: width,
                        color: MCColors.blue,
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  state.when(
                    move: (int index) => _selectQuiz(index),
                  ),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<QuizBloc, QuizState>(
          builder: (BuildContext context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: MCButton(
                buttonText: 'Далее',
                onTap: () {
                  context
                      .read<QuizBloc>()
                      .add(QuizEvent.move(index: state.index + 1));
                  if (state.index >= 5) {
                    Navigator.pushNamed(
                      context,
                      FinalQuestionScreen.routeName,
                    );
                  }
                  select = !select;
                  width = width + 36;
                },
                buttonType: ButtonType.blue,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _selectQuiz(int index) {
    switch (index) {
      case 0:
        return PersonDataSection();
      case 1:
        return AddPhotoSection();
      case 2:
        return SelectHeightSection();
      case 3:
        return SelectWeightSection();
      case 4:
        return SelectBloodTypeSection();
      case 5:
        return ArterialPressureSection();
      default:
        return ArterialPressureSection();
    }
  }
}
