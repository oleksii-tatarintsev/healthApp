import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoSection extends StatefulWidget {
  const AddPhotoSection({Key? key}) : super(key: key);

  @override
  State<AddPhotoSection> createState() => _AddPhotoSectionState();
}

class _AddPhotoSectionState extends State<AddPhotoSection> {
  File? image;

  Future<dynamic> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      Text(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            onTap: () => pickImage(ImageSource.camera),
                          ),
                          MCButton(
                            buttonText: 'Из галлереи',
                            buttonType: ButtonType.blue,
                            height: 50,
                            width: 130,
                            onTap: () => pickImage(ImageSource.gallery),
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
                  if (image != null)
                    ClipOval(
                      child: Image.file(
                        image!,
                        height: 120,
                        width: 120,
                      ),
                    )
                  else
                    Image.asset(AppImages.addPhoto),
                  SvgPicture.asset(AppIcons.addPhotoIcon),
                ],
              ),
            ),
          ),
          SizedBox(height: 290),
        ],
      ),
    );
  }
}
