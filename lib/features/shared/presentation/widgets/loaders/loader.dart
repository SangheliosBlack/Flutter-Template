import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class Loader extends StatelessWidget {

  final Widget view;
  final bool isLoading;

  const Loader({
    super.key,
    required this.view,
    required this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        view,
        if (isLoading) ...[
          Positioned.fill(
            child: Container(
              color: Colors.white.withValues(alpha: .8),
            ),
          ),
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                color: AppTheme.primary
              ),
            )
          )
        ],
        Container()
      ],
    );
  }
}
