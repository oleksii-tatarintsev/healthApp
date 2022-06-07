import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthapp/shared/style/export.dart';

// TODO: Домашка
/// Изучи каждый из этих параметров, что он делает.
/// Поэкспериментируй, задавай какие-то значения, посмотри.
/// Составь список вопросов на какой-то из наших созвонов
class MCTextField extends StatelessWidget {
  final String? title;
  final Color titleTextColor;
  final double? height;
  final int? maxLength;
  final int errorMaxLines;
  final double radius;
  final bool centerText;
  final bool? password;
  final bool enabled;
  final bool showError;
  final TextInputType? inputType;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final TextEditingController? textEditingController;
  final bool? isTextAlignCenter;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? filterTextInput;

  const MCTextField({
    required this.onChanged,
    this.enabled = true,
    this.titleTextColor = MCColors.grey,
    this.radius = 15.0,
    this.centerText = false,
    this.isTextAlignCenter = false,
    this.maxLines = 1,
    this.errorMaxLines = 2,
    this.showError = true,
    this.height,
    this.maxLength,
    this.title,
    this.password,
    this.textEditingController,
    this.inputType,
    this.validator,
    this.filterTextInput,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: MCTextStyles.black12Medium500.copyWith(color: titleTextColor),
        ),
        TextFormField(
          inputFormatters: filterTextInput,
          enabled: enabled,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: maxLength,
          textAlign: isTextAlignCenter! ? TextAlign.center : TextAlign.start,
          controller: textEditingController,
          obscureText: password ?? false,
          keyboardType: inputType ?? TextInputType.text,
          onChanged: onChanged,
          maxLines: maxLines,
          decoration: InputDecoration(
            counterText: '',
            errorStyle: showError ? null : TextStyle(height: 0),
            errorMaxLines: errorMaxLines,
            fillColor: MCColors.white,
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MCColors.lightGrey),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: MCColors.lightGrey),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MCColors.lightGrey),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: MCColors.violet,
              ),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MCColors.redError),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MCColors.redError),
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
