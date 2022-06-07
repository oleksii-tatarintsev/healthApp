import 'package:flutter/cupertino.dart';
import 'package:healthapp/shared/style/export.dart';

//TODO: Домашка
/// Как ты видишь тут есть энам для того чтоб разные цвета кнопки далеть и
/// разные разный цвет текста. Твоя задача, сделать екстеншин и переделать
/// этот виджет из StatefulWidget в StatelessWidget
enum ButtonType { blue, white }

class MCButton extends StatefulWidget {
  final ButtonType? buttonType;
  final String buttonText;
  final VoidCallback? onTap;

  const MCButton({
    required this.buttonText,
    this.buttonType,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<MCButton> createState() => _MCButtonState();
}

class _MCButtonState extends State<MCButton> {
  late final Color buttonColor;
  late final Color textColor;

  @override
  void initState() {
    switch (widget.buttonType) {
      case ButtonType.blue:
        {
          buttonColor = MCColors.blue;
          textColor = MCColors.white;
          break;
        }
      case ButtonType.white:
        {
          buttonColor = MCColors.white;
          textColor = MCColors.blue;
          break;
        }
      default:
        {
          buttonColor = MCColors.blue;
          textColor = MCColors.white;
          break;
        }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: widget.onTap,
      disabledColor: MCColors.lightGrey,
      color: buttonColor,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.onTap == null ? MCColors.lightGrey : MCColors.blue,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        height: 50.0,
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          widget.buttonText,
          style: MCTextStyles.black16SemiBold600.copyWith(
            color: widget.onTap == null ? MCColors.grey : textColor,
          ),
        ),
      ),
    );
  }
}
