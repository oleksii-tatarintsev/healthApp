part of 'quiz_bloc.dart';

@freezed
class QuizEvent with _$QuizEvent{
  const factory QuizEvent.move({required int index}) = QuizEventMove;
}