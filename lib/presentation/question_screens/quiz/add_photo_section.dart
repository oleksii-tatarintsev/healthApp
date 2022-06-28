import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthapp/domain/bloc/add_photo_bloc/add_photo_bloc.dart';
import 'package:healthapp/shared/style/export.dart';
import 'package:healthapp/shared/ui_kit/export.dart';
import 'package:healthapp/shared/ui_kit/show_toast.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoSection extends StatefulWidget {
  const AddPhotoSection({Key? key}) : super(key: key);

  @override
  State<AddPhotoSection> createState() => AddPhotoSectionState();
}

class AddPhotoSectionState extends State<AddPhotoSection> {
  File? image;
  final ValueNotifier<File?> imageTemporary = ValueNotifier(null);
  late FToast fToast;

  Future<dynamic> pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      imageTemporary.value = File(image.path);
      this.image = imageTemporary.value;
    } on PlatformException catch (e) {
      Text(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPhotoBloc, AddPhotoState>(
      builder: (BuildContext context, state) {
        print(state);

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
                                onTap: () =>
                                  pickImage(ImageSource.camera),
                              ),
                              MCButton(
                                buttonText: 'Из галлереи',
                                buttonType: ButtonType.blue,
                                height: 50,
                                width: 130,
                                onTap: () =>
                                  pickImage(ImageSource.gallery),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: ValueListenableBuilder<File?>(
                    valueListenable: imageTemporary,
                    builder:
                        (BuildContext context, File? value, Widget? child) {
                      context.read<AddPhotoBloc>().addPhoto(value);

                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          if (image != null)
                            CircleAvatar(
                              radius: 100,
                              backgroundImage: FileImage(image!),
                            )
                          else
                            Image.asset(AppImages.addPhoto),
                          SvgPicture.asset(AppIcons.addPhotoIcon),
                        ],
                      );
                    },
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
          error: (error) => fToast.showToast(
            child: ShowToast(errorMessage: error),
            gravity: ToastGravity.TOP,
            toastDuration: Duration(seconds: 2),
          ),
        );
      },
    );
  }
}
