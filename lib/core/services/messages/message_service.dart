import 'package:flutter/material.dart';

abstract interface class MessageService {
  
  Future<void> showTop({required BuildContext context,required String message});
  
}