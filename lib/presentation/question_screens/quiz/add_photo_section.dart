import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthapp/domain/bloc/add_photo_bloc/add_photo_bloc.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoSection extends StatefulWidget {
  const AddPhotoSection({Key? key}) : super(key: key);

  @override
  State<AddPhotoSection> createState() => AddPhotoSectionState();
}

class AddPhotoSectionState extends State<AddPhotoSection> {
  Future<XFile?> pickImage(ImageSource source) async {
    try {
      return await ImagePicker().pickImage(source: source);
    } on PlatformException catch (e) {
      Text(e.toString());
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPhotoBloc, AddPhotoState>(
      builder: (BuildContext context, state) {
        final AddPhotoBloc bloc = context.read<AddPhotoBloc>();

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                'Добавьте ваше фото',
                style: MCTextStyles.black20SemiBold600,
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 120,
                width: 120,
                child: GestureDetector(
                  onTap: () {
                    MCDialogs.showMCDialog(
                      context: context,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(40),
                            child: Text(
                              'Добавить фото',
                              style: MCTextStyles.black16SemiBold600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MCButton(
                                buttonText: 'Сделать фото',
                                buttonType: ButtonType.white,
                                height: 50,
                                width: 130,
                                onTap: () async {
                                  await pickImage(ImageSource.camera)
                                      .whenComplete(
                                    () => Navigator.pop(context),
                                  );
                                },
                              ),
                              MCButton(
                                buttonText: 'Из галлереи',
                                buttonType: ButtonType.blue,
                                height: 50,
                                width: 130,
                                onTap: () async {
                                  final XFile? image =
                                      await pickImage(ImageSource.gallery);
                                  if (image != null) {
                                    context
                                        .read<AddPhotoBloc>()
                                        .addPhoto(File(image.path));
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      if (bloc.image != null)
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(bloc.image!),
                        )
                      else
                        Image.asset(AppImages.addPhoto),
                      SvgPicture.asset(AppIcons.addPhotoIcon),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, AddPhotoState state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => ToastMessenger.showContainer(
            context: context,
            child: ShowToast(errorMessage: error),
          ),
        );
      },
    );
  }
}
