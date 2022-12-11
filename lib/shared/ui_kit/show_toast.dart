import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthapp/shared/style/export.dart';

class ShowToast extends StatelessWidget {
  final String errorMessage;
  const ShowToast({
    required this.errorMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MCColors.redError,
      ),
      child: Text(
        errorMessage,
        style: MCTextStyles.black14Medium500,
      ),
    );
  }
}

class ToastMessenger {
  static void showContainer({
    required BuildContext context,
    required Widget child,
  }) {
    final FToast fToast = FToast();
    fToast.init(context);

    return fToast.showToast(
      child: child,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 2),
    );
  }
}
