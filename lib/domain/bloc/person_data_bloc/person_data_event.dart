part of 'person_data_bloc.dart';

@freezed
class PersonDataEvent with _$PersonDataEvent {

  const factory PersonDataEvent.changed({
    required DateTime dateValue,
    required String genderValue,
  }) = PersonDataEventMove;

  const factory PersonDataEvent.further({
    required DateTime date,
    required String gender,
  }) = PersonDataEventFurther;
}
