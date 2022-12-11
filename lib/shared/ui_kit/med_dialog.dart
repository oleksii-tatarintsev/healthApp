import 'package:flutter/material.dart';
import 'package:healthapp/shared/style/export.dart';

class MCDialogs {
  static Future<void> showMCDialog({
    required BuildContext context,
    required Widget child,
    bool dismissible = true,
    double height = 200,
    double? width,
  }) async {
    await showDialog<Dialog>(
      context: context,
      useSafeArea: true,
      barrierColor: MCColors.black.withOpacity(0.7),
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: SizedBox(
            width: width,
            height: height,
            child: child,
          ),
        );
      },
    );
  }
}
