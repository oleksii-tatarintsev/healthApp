import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthapp/shared/style/export.dart';

part 'add_photo_bloc.freezed.dart';
part 'add_photo_event.dart';
part 'add_photo_state.dart';

class AddPhotoBloc extends Bloc<AddPhotoEvent, AddPhotoState> {
  String imagePath = AppImages.addPhoto;
  File? image;

  AddPhotoBloc() : super(AddPhotoState.initial()) {
    on<AddPhotoEvent>((event, emit) {
      event.map(
        changed: (_){
          if(imagePath == AppImages.addPhoto && image == null){
            emit(AddPhotoState.error(errorMessage: 'Установите фотографию'));
          } else {
            emit(AddPhotoState.valid());
          }
        },
        further: (_){
          emit(AddPhotoState.loading());
        },
      );
    });
  }
  void addPhoto(File? value){
    image = value;
  }
}
