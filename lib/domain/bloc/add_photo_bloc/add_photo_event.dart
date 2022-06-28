part of 'add_photo_bloc.dart';

@freezed
class AddPhotoEvent with _$AddPhotoEvent{

  const factory AddPhotoEvent.initial() = AddPhotoEventInitial;

  const factory AddPhotoEvent.changed() = AddPhotoEventChanged;

  const factory AddPhotoEvent.further() = AddPhotoEventFurther;
}