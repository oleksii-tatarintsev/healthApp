part of 'person_data_bloc.dart';

@freezed
class PersonDataEvent with _$PersonDataEvent {

  const factory PersonDataEvent.changed() = PersonDataEventMove;

  const factory PersonDataEvent.further() = PersonDataEventFurther;
}
