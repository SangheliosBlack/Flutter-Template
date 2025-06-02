import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/application/use_cases/providers/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleNameWidget extends ConsumerWidget {
  
  const RoleNameWidget({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final authState = ref.watch(authProvider).user;

    return Text(
      authState!.role.name,
      style: GoogleFonts.quicksand(
        color: Colors.black,
        fontWeight: FontWeight.w300,
        fontSize: 11
      ),
    );

  }

}