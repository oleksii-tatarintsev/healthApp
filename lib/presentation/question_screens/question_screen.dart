import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthapp/domain/bloc/add_photo_bloc/add_photo_bloc.dart';
import 'package:healthapp/domain/bloc/blood_type_bloc/blood_type_bloc.dart';
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
  final GlobalKey<SelectHeightSectionState> heightSectionKey = GlobalKey();
  final GlobalKey<SelectWeightSectionState> weightSectionKey = GlobalKey();
  final GlobalKey<SelectBloodTypeSectionState> bloodTypeSectionKey =
      GlobalKey();
  final GlobalKey<ArterialPressureSectionState> pressureSectionKey =
      GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuizBloc>(
          create: (BuildContext context) => QuizBloc(),
        ),
        BlocProvider<PersonDataBloc>(
          create: (BuildContext context) => PersonDataBloc(),
        ),
        BlocProvider<AddPhotoBloc>(
          create: (BuildContext context) => AddPhotoBloc(),
        ),
        BlocProvider<BloodTypeBloc>(
          create: (BuildContext context) => BloodTypeBloc(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
                          onPressed: () =>
                              backButton(context: context, state: state),
                        ),
                        // if (state.index == 0)
                        //   SizedBox()
                        // else
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
                            width: ((MediaQuery.of(context).size.width - 105) /
                                    6) *
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
                  onTap: () async =>
                      _submitQuiz(context: context, state: state),
                  buttonType: ButtonType.blue,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _submitQuiz({
    required BuildContext context,
    required QuizState state,
  }) async {
    switch (state.index) {
      case 0:
        {
          if (personDataSectionKey.currentState!.submitForm()) {
            personDataSectionKey.currentContext!
                .read<PersonDataBloc>()
                .add(PersonDataEvent.changed());
            if (BlocProvider.of<PersonDataBloc>(
              personDataSectionKey.currentContext!,
              listen: false,
            ).state is PersonDataStateValid) {
              await Future.delayed(
                Duration(milliseconds: 500),
                () => context.read<QuizBloc>().add(
                      QuizEvent.move(index: state.index + 1),
                    ),
              );
            }
          }
        }
        break;
      case 1:
        {
          context.read<AddPhotoBloc>().add(AddPhotoEvent.changed());
          if (addPhotoSectionKey.currentContext!.read<AddPhotoBloc>().state
              is AddPhotoStateValid) {
            context
                .read<QuizBloc>()
                .add(QuizEvent.move(index: state.index + 1));
          }
        }
        break;
      case 2:
        {
          context.read<QuizBloc>().add(QuizEvent.move(index: state.index + 1));
        }
        break;
      case 3:
        {
          context.read<QuizBloc>().add(QuizEvent.move(index: state.index + 1));
        }
        break;
      case 4:
        {
          context.read<BloodTypeBloc>().add(BloodTypeEvent.changed());
          if (bloodTypeSectionKey.currentContext!.read<BloodTypeBloc>().state
              is BloodTypeStateValid) {
            context
                .read<QuizBloc>()
                .add(QuizEvent.move(index: state.index + 1));
          }
        }
        break;
      case 5:
        {
          await Navigator.pushNamed(
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

  void backButton({required BuildContext context, required QuizState state}) {
    switch (state.index) {
      case 0:
        {
          Navigator.pop(context);
        }
        break;
      case 1:
        {
          context.read<QuizBloc>().add(QuizEvent.move(index: state.index - 1));
          context.read<PersonDataBloc>().add(PersonDataEvent.initial());
        }
        break;
      case 2:
        {
          context.read<QuizBloc>().add(QuizEvent.move(index: state.index - 1));
          context.read<AddPhotoBloc>().add(AddPhotoEvent.initial());
        }
        break;
      case 3:
        {
          context.read<QuizBloc>().add(QuizEvent.move(index: state.index - 1));
        }
        break;
      case 4:
        {
          context.read<QuizBloc>().add(QuizEvent.move(index: state.index - 1));
        }
        break;
      case 5:
        {
          context.read<QuizBloc>().add(QuizEvent.move(index: state.index - 1));
          context.read<BloodTypeBloc>().add(BloodTypeEvent.initial());
        }
        break;
    }
  }

  Widget _selectQuiz(int index) {
    switch (index) {
      case 0:
        return PersonDataSection(key: personDataSectionKey);
      case 1:
        return AddPhotoSection(key: addPhotoSectionKey);
      case 2:
        return SelectHeightSection(key: heightSectionKey);
      case 3:
        return SelectWeightSection(key: weightSectionKey);
      case 4:
        return SelectBloodTypeSection(key: bloodTypeSectionKey);
      case 5:
        return ArterialPressureSection(key: pressureSectionKey);
      default:
        return ArterialPressureSection();
    }
  }
}
