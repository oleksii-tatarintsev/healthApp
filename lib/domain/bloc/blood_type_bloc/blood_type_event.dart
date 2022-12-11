part of 'blood_type_bloc.dart';

@freezed
class BloodTypeEvent with _$BloodTypeEvent {
  const factory BloodTypeEvent.initial() = BloodTypeEventInitial;

  const factory BloodTypeEvent.changed() = BloodTypeEventChanged;

  const factory BloodTypeEvent.further() = BloodTypeEventFurther;
}
