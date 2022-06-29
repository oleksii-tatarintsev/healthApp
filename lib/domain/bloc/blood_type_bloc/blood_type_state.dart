part of 'blood_type_bloc.dart';

@freezed
class BloodTypeState with _$BloodTypeState {
  const factory BloodTypeState.initial() = BloodTypeStateInitial;

  const factory BloodTypeState.valid() = BloodTypeStateValid;

  const factory BloodTypeState.error({required String errorMessage}) =
      BloodTypeStateError;

  const factory BloodTypeState.loading() = BloodTypeStateLoading;
}
