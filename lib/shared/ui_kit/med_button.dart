import 'package:flutter/cupertino.dart';
import 'package:healthapp/shared/style/export.dart';

class MCButton extends StatelessWidget {
  final ButtonType buttonType;
  final String buttonText;
  final VoidCallback? onTap;
  final double? height;
  final double? width;

  const MCButton({
    required this.buttonText,
    required this.buttonType,
    this.onTap,
    Key? key,
    this.height = 50,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      disabledColor: MCColors.lightGrey,
      color: buttonType.getButtonColor,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: onTap == null ? MCColors.lightGrey : MCColors.blue,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        height: height,
        alignment: Alignment.center,
        width: width,
        child: Text(
          buttonText,
          style: MCTextStyles.black16SemiBold600.copyWith(
            color: onTap == null ? MCColors.grey : buttonType.getTextColor,
          ),
        ),
      ),
    );
  }
}

enum ButtonType { blue, white }

extension GetButtonStyle on ButtonType {
  Color get getButtonColor {
    switch (this) {
      case ButtonType.blue:
        {
          return MCColors.blue;
        }
      case ButtonType.white:
        {
          return MCColors.white;
        }
      default:
        {
          return MCColors.blue;
        }
    }
  }

  Color get getTextColor {
    switch (this) {
      case ButtonType.blue:
        {
          return MCColors.white;
        }
      case ButtonType.white:
        {
          return MCColors.blue;
        }
      default:
        {
          return MCColors.white;
        }
    }
  }
}
