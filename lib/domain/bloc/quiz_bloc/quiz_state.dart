part of 'quiz_bloc.dart';

@freezed
class QuizState with _$QuizState{
  const factory QuizState.move({required int index}) = QuizStateMove;
}