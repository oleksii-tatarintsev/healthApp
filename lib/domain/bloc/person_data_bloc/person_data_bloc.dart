import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_data_bloc.freezed.dart';
part 'person_data_event.dart';
part 'person_data_state.dart';

class PersonDataBloc extends Bloc<PersonDataEvent, PersonDataState> {
  String gender = '';
  DateTime? birthDate;

  PersonDataBloc() : super(PersonDataState.initial()) {
    on<PersonDataEvent>(
      (event, emit) {
        event.map(
          changed: (_) {
            if(gender == ''){
              emit(PersonDataState.error(errorMessage: 'Выберете пол'));
            } else if(birthDate == null){
              emit(PersonDataState.error(errorMessage: 'Выберете дату рождения'));
            } else{
              emit(PersonDataState.valid());
            }
          },
          further: (_) {
            emit(PersonDataState.loading());
          },
        );
      },
    );
  }
  void genderSelect(String value){
    gender = value;
  }

  void birthDateSelect(DateTime value){
    birthDate = value;
  }
}
