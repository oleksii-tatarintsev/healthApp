part of 'add_photo_bloc.dart';

@freezed
class AddPhotoState with _$AddPhotoState {
  const factory AddPhotoState.initial() = AddPhotoStateInitial;

  const factory AddPhotoState.valid() = AddPhotoStateValid;

  const factory AddPhotoState.error({required String errorMessage}) =
      AddPhotoStateError;

  const factory AddPhotoState.loading() = AddPhotoStateLoading;
}
