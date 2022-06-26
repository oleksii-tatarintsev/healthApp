part of 'person_data_bloc.dart';

@freezed
class PersonDataState with _$PersonDataState {
  const factory PersonDataState.initial() = PersonDataStateInitial;

  const factory PersonDataState.valid() = PersonDataStateValid;

  const factory PersonDataState.error({required String errorMessage}) = PersonDataStateError;

  const factory PersonDataState.loading() = PersonDataStateLoading;
}
