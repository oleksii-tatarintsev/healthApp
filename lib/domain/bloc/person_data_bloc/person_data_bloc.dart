import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_data_bloc.freezed.dart';
part 'person_data_event.dart';
part 'person_data_state.dart';

class PersonDataBloc extends Bloc<PersonDataEvent, PersonDataState> {
  String gender = '';
  DateTime birthDate = DateTime.now();

  PersonDataBloc() : super(PersonDataState.initial()) {
    on<PersonDataEvent>(
      (event, emit) {
        event.map(
          changed: (state) {

          },
          further: (state) {
            emit(PersonDataState.loading());
          },
        );
      },
    );
  }
}
