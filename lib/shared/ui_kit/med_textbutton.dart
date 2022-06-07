import 'package:flutter/cupertino.dart';
import 'package:healthapp/shared/style/export.dart';

class MCTextButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final bool underline;
  // TODO: Домашка
  /// Замени виджет на путь к инонке
  final Widget? icon;

  const MCTextButton({
    required this.buttonText,
    this.icon,
    this.onPressed,
    this.underline = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Row(
                  children: [
                    icon!,
                    const SizedBox(width: 10),
                  ],
                )
              else
                SizedBox(),
              Text(
                buttonText!,
                style: MCTextStyles.blue14Bold700.copyWith(
                  decoration: underline
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
