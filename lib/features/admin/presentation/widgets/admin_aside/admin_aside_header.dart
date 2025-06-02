import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/admin/presentation/presentation.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAsideHeader extends ConsumerStatefulWidget {

  const AdminAsideHeader({super.key});

  @override
  ConsumerState<AdminAsideHeader> createState() => _AdminAsideHeader();

}
class _AdminAsideHeader extends ConsumerState<AdminAsideHeader> {

  @override
  Widget build(BuildContext context) {


    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const LogoWiget(),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CMS 2.0",
                            style: GoogleFonts.quicksand(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          const AdminAsideCommercialPlatformSelected(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_sharp),
            ],
          ),
        ),
      ),
    );
  }

  }
