import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AppMessages {
  static showToast(
          {required String msg,
          Toast? duration = Toast.LENGTH_SHORT,
          ToastGravity? gravity = ToastGravity.BOTTOM,
          Color? backgroundColor = Colors.grey,
          Color? textColor = Colors.white,
          double? fontSize = 16.0}) =>
      Fluttertoast.showToast(
          msg: msg,
          toastLength: duration,
          gravity: gravity,
          timeInSecForIosWeb: 1,
          backgroundColor: backgroundColor?.withOpacity(0.4),
          textColor: textColor,
          fontSize: fontSize);

  static showSnackBar(
          {required BuildContext context, required String message}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: GoogleFonts.quicksand(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          duration: const Duration(seconds: 3),
          closeIconColor: Colors.white,
          elevation: 1,
          showCloseIcon: true,
        ),
      );

  static showCustomDialog(
          {required BuildContext context,
          required Widget view,
          bool barrierDismissible = false}) =>
      showDialog(
          barrierDismissible: barrierDismissible,
          context: context,
          builder: (context) => Dialog(
                child: view,
              ));

  static showAlertWithActions(
          {required BuildContext context,
          Widget? title,
          Widget? content,
          required Function action,
          bool barrierDismissible = false}) =>
      showDialog(
          barrierDismissible: barrierDismissible,
          context: context,
          builder: (context) => Platform.isAndroid
              ? AlertDialog(
                  title: title,
                  content: content,
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          action();
                        },
                        child: const Text('Aceptar'))
                  ],
                )
              : CupertinoAlertDialog(
                  title: title,
                  content: content,
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                        action();
                      },
                      child: const Text('Aceptar'),
                    ),
                  ],
                ));

  static showAlertWithoutActions(
          {required BuildContext context,
          Widget? title,
          Widget? content,
          bool barrierDismissible = false,
          Function? action}) =>
      showDialog(
          barrierDismissible: barrierDismissible,
          context: context,
          builder: (context) => Platform.isAndroid
              ? AlertDialog(
                  title: title,
                  content: content,
                  actions: [
                    TextButton(
                        onPressed: () {
                          if (action != null) {
                            action();
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Aceptar'))
                  ],
                )
              : CupertinoAlertDialog(
                  title: title,
                  content: content,
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Aceptar'),
                    ),
                  ],
                ));
}
