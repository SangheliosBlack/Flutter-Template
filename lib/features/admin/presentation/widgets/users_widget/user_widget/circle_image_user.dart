import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/utils/avatar_name.dart';
import 'package:flutter_template/features/auth/application/use_cases/providers/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminUserImageWidget extends ConsumerWidget {

  const AdminUserImageWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final authState = ref.watch(authProvider);

    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white.withAlpha(150)
        ),
        color: Color(0xffDD052B),
        shape: BoxShape.circle
      ),
      child: Container(
        padding: EdgeInsets.all(2),
        width:  30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle
        ),
        child: Center(
          child: Text(
            AvatarName.getAvatarLetters(name: authState.user!.name),
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15
            ),
          ),
        ),
      ),
    );

  }

}