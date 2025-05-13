import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/auth/application/use_cases/providers/auth_provider.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:flutter_template/helpers/extensions.dart';

class PointOfSaleLayout extends ConsumerStatefulWidget {
  final Widget child;

  const PointOfSaleLayout({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<PointOfSaleLayout> createState() => _PointOfSaleLayoutState();
  
}

class _PointOfSaleLayoutState extends ConsumerState<PointOfSaleLayout> {

  @override
  void initState() {
    
    super.initState();

    Future.microtask(() {

      ref.read(authProvider.notifier).updateFcmToken();
      
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      width: context.width,
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: Row(
          children: [
            AsideMenu(),
            Expanded(child: widget.child),
            AccountMenu(),
          ],
        ),
      ),
    );
  }
}
