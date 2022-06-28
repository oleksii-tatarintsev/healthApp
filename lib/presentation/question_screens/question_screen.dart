import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthapp/domain/bloc/add_photo_bloc/add_photo_bloc.dart';
import 'package:healthapp/domain/bloc/person_data_bloc/person_data_bloc.dart';
import 'package:healthapp/domain/bloc/quiz_bloc/quiz_bloc.dart';
import 'package:healthapp/presentation/export.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';

class QuestionScreen extends StatelessWidget {
  static const routeName = '/question_screen';
  QuestionScreen({Key? key}) : super(key: key);
  final GlobalKey<PersonDataSectionState> personDataSectionKey = GlobalKey();
  final GlobalKey<AddPhotoSectionState> addPhotoSectionKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                          if (state.index == 0) {
                            Navigator.pop(
                              context,
                            );
                          } else {
                            context
                                .read<QuizBloc>()
                                .add(QuizEvent.move(index: state.index - 1));
                          }
                        },
                      ),
                      if (state.index == 0)
                        SizedBox()
                      else
                        TextButton(
                          onPressed: () {
                            if (state.index >= 5) {
                              Navigator.pushNamed(
                                context,
                                FinalQuestionScreen.routeName,
                              );
                            } else {
                              context.read<QuizBloc>().add(
                                    QuizEvent.move(index: state.index + 1),
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
                  SizedBox(
                    child: Stack(
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
                          width:
                              ((MediaQuery.of(context).size.width - 105) / 6) *
                                  state.index,
                          color: MCColors.blue,
                        ),
                      ],
                    ),
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 30,
              ),
              child: MCButton(
                buttonText: 'Далее',
                onTap: () => _submitQuiz(context: context, state: state),
                buttonType: ButtonType.blue,
              ),
            );
          },
        ),
      ),
    );
  }

  void _submitQuiz({required BuildContext context, required QuizState state}) {
    switch (state.index) {
      case 0:
        {
          if (personDataSectionKey.currentState!.submitForm()) {
            personDataSectionKey.currentContext!
                .read<PersonDataBloc>()
                .add(PersonDataEvent.changed());
            if (personDataSectionKey.currentContext!
                .read<PersonDataBloc>()
                .state is PersonDataStateValid) {
              context
                  .read<QuizBloc>()
                  .add(QuizEvent.move(index: state.index + 1));
            }
          }
        }
        break;
      case 1:
        {
            if (addPhotoSectionKey.currentState! is AddPhotoStateInitial) {
              context.read<AddPhotoBloc>().add(AddPhotoEvent.changed());
              if (addPhotoSectionKey.currentContext!
                  .read<AddPhotoBloc>()
                  .state is AddPhotoStateValid) {
                context
                    .read<QuizBloc>()
                    .add(QuizEvent.move(index: state.index + 1));
              }
            }
          }
        break;
      case 5:
        {
          Navigator.pushNamed(
            context,
            FinalQuestionScreen.routeName,
          );
          break;
        }
      default:
        {
          context.read<QuizBloc>().add(QuizEvent.move(index: state.index + 1));
        }
    }
  }

  Widget _selectQuiz(int index) {
    switch (index) {
      case 0:
        return BlocProvider<PersonDataBloc>(
          create: (BuildContext context) => PersonDataBloc(),
          child: PersonDataSection(key: personDataSectionKey),
        );
      case 1:
        return BlocProvider<AddPhotoBloc>(
          child: AddPhotoSection(
            key: addPhotoSectionKey,
          ),
          create: (BuildContext context) => AddPhotoBloc(),
        );
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
