part of 'person_data_bloc.dart';

@freezed
class PersonDataEvent with _$PersonDataEvent {

  const factory PersonDataEvent.changed() = PersonDataEventChanged;

  const factory PersonDataEvent.further() = PersonDataEventFurther;
}
