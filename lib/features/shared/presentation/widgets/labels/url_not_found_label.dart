import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/router/current_route.dart';
import 'package:google_fonts/google_fonts.dart';

class UrlNotFoundLabel extends ConsumerWidget {

  const UrlNotFoundLabel({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final String url = ref.watch(currentRouteProvider);

    return  Container(
      padding: EdgeInsets.symmetric(
        vertical: 10
      ),
      child: Text(
        url,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 30
        ),
      ),
    );

  }

}