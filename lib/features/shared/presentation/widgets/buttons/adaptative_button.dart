import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AdaptativeButton extends StatelessWidget {

  final GestureTapCallback onTap;
  final bool isLoading;
  final double height;
  final double borderRadius;
  final String labelText;
  final bool disabled;
  
  const AdaptativeButton({
    super.key,
    required this.onTap,
    required this.labelText,
    required this.isLoading,
    this.height = 50,
    this.borderRadius = 1000,
    this.disabled = false  
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: disabled ? .9 : 1,
              child: GestureDetector(
                onTap: onTap,
                child: SizedBox(
                  height: height,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AnimatedContainer(
                          key:  ValueKey<String>(labelText),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              isLoading ? 100 : 25
                            ),
                            color: AppTheme.primary
                          ),
                          duration :const Duration(milliseconds: 300),
                          child: Center(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: isLoading
                                ? const SizedBox(
                                    height: 16,
                                    width: 16,
                                    child:
                                      CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 1,
                                      ),
                                  )
                                : Text(
                                    labelText,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 15,
                                    )
                                  )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
              )
        ),
      ],
    );

  }

}