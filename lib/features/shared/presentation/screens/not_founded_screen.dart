import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/auth/presentation/widgets/web/footer_bar.dart';
import 'package:flutter_template/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NotFoundedScreen extends ConsumerWidget {

  const NotFoundedScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: ResponsiveBuilder(
              builder: (BuildContext context, SizingInformation sizingInformation) {
                return Container(
                  width: context.width,
                  height: context.height,
                  padding: EdgeInsets.symmetric(
                  ),
                  child: Stack(
                    children: [
                      PageNotFound(),
                      Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25
                          ),
                          constraints: BoxConstraints(
                            maxWidth: 400,
                            minWidth: 300
                          ),
                          height: context.height,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SrryNotFoundPage(),
                                UrlNotFoundLabel(),
                                BackToHomeButton()
                              ],
                            ) ,
                          ),
                      )
                    ]
                  ),
                );
              }
            ),
          ),
          Footer()
        ],
      ),
    );
  }
}
