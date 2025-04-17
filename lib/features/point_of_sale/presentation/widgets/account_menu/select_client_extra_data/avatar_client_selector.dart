import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/config.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';

class AvatarClientSelector extends ConsumerWidget {

  final IconData icon;
  final Function()? onTap;
  final bool isActive;

  const AvatarClientSelector({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isActive
  });

  @override
  Widget build(BuildContext context,ref) {

    final orderCartState= ref.watch(orderCartProvider);

    return GestureDetector(
      onTap:  onTap,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: orderCartState.deliveyAdded ? AppTheme.primary : Colors.grey.withAlpha(75),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          icon,
          color: !orderCartState.deliveyAdded ? Colors.grey.withAlpha(150) : Colors.white
        ),
      ),
    );

  }

}