import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/pos_printer/providers/pos_printer_provider.dart';  // Asegúrate de tener esto importado

class PrinterWidget extends ConsumerWidget {
  
    const PrinterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final isConnected = ref.watch(printerConnectionProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 5,
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: AvatarGlow(
            glowRadiusFactor: 1,
            glowColor: isConnected ? Colors.green : Colors.red,
            child: Material(
              elevation: 8.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 5.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isConnected ? Colors.green : Colors.red, 
                ),
              ),
             ),
           ),
          ),
        ),
        Image(
          image: 
          AssetImage("assets/images/printer.jpg"), 
          width:  50, 
          height: 50
        ),
      ],
    );
  }
}
