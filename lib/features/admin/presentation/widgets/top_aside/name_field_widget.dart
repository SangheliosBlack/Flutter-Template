import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/application/use_cases/providers/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class NameFieldWidget extends ConsumerWidget {

  const NameFieldWidget({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final authState = ref.read(authProvider).user;

    return Text(
      authState!.name,
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14
      ),
    );

  }

}