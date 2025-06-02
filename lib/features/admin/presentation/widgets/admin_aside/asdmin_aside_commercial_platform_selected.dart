import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAsideCommercialPlatformSelected extends ConsumerWidget {

  const AdminAsideCommercialPlatformSelected({super.key});

  @override
  Widget build(BuildContext context,ref) {


    return Text(
    "Service" , 
    style: GoogleFonts.quicksand(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    overflow: TextOverflow.ellipsis,
    );

  }

}