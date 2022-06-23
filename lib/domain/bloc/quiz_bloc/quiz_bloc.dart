import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_bloc.freezed.dart';
part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizState.move(index: 0)) {
    on<QuizEvent>((event, emit) {
      event.map(move: (state) {
        emit(QuizState.move(index: state.index));
      });
    });
  }
  void incrementQuiz() {
    add(QuizEvent.move(index: state.index + 1));
  }

  void decrementQuiz() {
    add(QuizEvent.move(index: state.index - 1));
  }
}
