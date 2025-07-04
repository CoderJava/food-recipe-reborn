import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetHelper {
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void unfocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Future<void> showDialogMessage(BuildContext context, String? title, String message,) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? 'info'.tr()),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('dismiss'.tr()),
            ),
          ],
        );
      }
    );
  }
}
