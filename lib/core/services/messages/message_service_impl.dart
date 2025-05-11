import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/core/services/messages/messages.dart';

Flushbar? _flushbar; 

class MessageServiceImpl implements MessageService {

  @override
  Future<void> showTop({required BuildContext context, required String message}) async {
    _flushbar = Flushbar<bool>(
      message: "Revise sus ventas",
      titleSize: 30,
      title: message,
      messageSize: 20,
      flushbarStyle: FlushbarStyle.GROUNDED,
      duration: const Duration(seconds: 3),
      backgroundColor: AppTheme.primary,
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderRadius: BorderRadius.circular(5),
      mainButton: TextButton(
        onPressed: () {
          _flushbar?.dismiss(); 
        },
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 18,
        ),
      ),
    );

    await _flushbar!.show(context);     

  }
  
}
