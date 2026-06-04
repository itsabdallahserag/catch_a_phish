import 'package:flutter/material.dart';

class AppDialogUtils {
  // Loading Dialog
  static void showLoading({
    required BuildContext context,
    required Color colorCircle,
    required TextStyle style,
    required Color backgroundColor,
    bool dismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => PopScope(
        canPop: dismissible,
        child: AlertDialog(
          backgroundColor: backgroundColor,
          content: Row(
            children: [
              CircularProgressIndicator(color: colorCircle),
              const SizedBox(width: 20),
              Expanded(child: Text('Loading...', style: style)),
            ],
          ),
        ),
      ),
    );
  }

  // Hide Loading
  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Message Dialog
  static void showMessage({
    required BuildContext context,
    required String message,

    String? title,

    TextStyle? titleStyle,
    TextStyle? messageStyle,

    Color? dialogBackgroundColor,

    String? posActionName,
    VoidCallback? posActionCallBack,
    TextStyle? posActionStyle,

    String? negActionName,
    VoidCallback? negActionCallBack,
    TextStyle? negActionStyle,

    bool dismissible = false,
  }) {
    final actions = <Widget>[];

    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posActionCallBack?.call();
          },
          child: Text(posActionName, style: posActionStyle),
        ),
      );
    }

    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negActionCallBack?.call();
          },
          child: Text(negActionName, style: negActionStyle),
        ),
      );
    }

    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => PopScope(
        canPop: dismissible,
        child: AlertDialog(
          backgroundColor: dialogBackgroundColor,

          title: title != null ? Text(title, style: titleStyle) : null,

          content: Text(message, style: messageStyle),

          actions: actions,
        ),
      ),
    );
  }
}
