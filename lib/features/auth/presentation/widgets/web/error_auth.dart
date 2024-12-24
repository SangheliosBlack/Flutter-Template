import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/application/providers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorAuthWidget extends ConsumerWidget {

  const ErrorAuthWidget({super.key});

  @override
  Widget build(BuildContext context,ref) {


    final errorAuthMessage = ref.watch(authControllerProvider).errorMessage;

    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      child: Container(
        margin: EdgeInsets.only(
        top: 7
      ),
        height: errorAuthMessage.isEmpty ? 0 : 16,
        child: Text(
          errorAuthMessage,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          textAlign: TextAlign.center,
          style: GoogleFonts.quicksand(
            color: Colors.red,
            fontSize: 13
          ),
        ),
      ),
    );

  }

}