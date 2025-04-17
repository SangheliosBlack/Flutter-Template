import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogService {

  static Future<void> showAlertDialog({
    required BuildContext context,
    required Widget content,
  }) {

    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withAlpha(50),
      builder: (context) => AlertDialog(
        content: content,
        contentPadding: EdgeInsets.zero,
      )
    );

  }

  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget content,
    bool isDismissible = true,
    bool useSafeArea = true,
  }) {

    return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [content],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
      ),
    );

  }
}
