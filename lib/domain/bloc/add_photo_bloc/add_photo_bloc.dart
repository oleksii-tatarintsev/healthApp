import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_photo_bloc.freezed.dart';
part 'add_photo_event.dart';
part 'add_photo_state.dart';

class AddPhotoBloc extends Bloc<AddPhotoEvent, AddPhotoState> {
  File? image;

  AddPhotoBloc() : super(AddPhotoState.initial()) {
    on<AddPhotoEvent>(
      (event, emit) {
        event.map(
          changed: (_) {
            if (image == null) {
              emit(AddPhotoState.error(errorMessage: 'Установите фотографию'));
            } else {
              emit(AddPhotoState.valid());
            }
          },
          further: (_) {
            emit(AddPhotoState.loading());
          },
          initial: (_) {
            emit(AddPhotoState.initial());
          },
        );
      },
    );
  }
  void addPhoto(File? value) {
    add(AddPhotoEvent.further());
    image = value;
    add(AddPhotoEvent.changed());
  }
}
