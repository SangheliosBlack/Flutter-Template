import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorAuthWidget extends ConsumerWidget {

  const ErrorAuthWidget({super.key});

  @override
  Widget build(BuildContext context,ref) {


    final errorAuthMessage = ref.watch(authProvider).errorMessage;

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