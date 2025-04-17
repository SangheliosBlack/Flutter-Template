import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/clients/application/providers/clients_provider.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:flutter_template/features/point_of_sale/presentation/views/dialogs/add_client_dialog.dart';
import 'package:flutter_template/features/shared/presentation/utils/show_custom_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectClientCard extends ConsumerWidget {

  const SelectClientCard({super.key});

  @override
  Widget build(BuildContext context,ref) {

  final clientSelected = ref.watch(orderCartProvider).clientSelected;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 14
      ),
      child: Badge(
        largeSize: 25,
        backgroundColor:  clientSelected != null  ? const Color.fromARGB(255, 255, 202, 198) : AppTheme.secondary,
         label: GestureDetector(
            onTap: () {

              ref.read(clientsProvider.notifier).getClientByPhone(phone: "");

            },
            behavior: HitTestBehavior.translucent,
           child: AnimatedContainer(
                   duration: Duration(milliseconds: 300),
                   width:  20,
                   height: 30,
                   child: Center(
            child: Icon(
              clientSelected != null ? Icons.remove : Icons.add,
              size: 20,
              color: clientSelected != null ? Colors.red : AppTheme.primary,
            )
                   )
                 ),
         ),
        child: GestureDetector(
           onTap: () {

              CustomDialogService.showAlertDialog(
                context: context, 
                content:  AddNewClientDialog(
                  addInmediately: true
                )
              );
              
            },
          behavior: HitTestBehavior.translucent,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
            ),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.grey.withAlpha(75),
                width: 1
              )
            ),
            child: Row(
              spacing: 10,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withAlpha(75)
                  ),
                  child: clientSelected != null 
                    ? Text(
                        clientSelected.name.contains(' ') 
                        ? clientSelected.name.split(' ').map((e) => e[0].toUpperCase()).take(2).join() 
                        : clientSelected.name.substring(0, 2).toUpperCase(),
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    )
                    : Icon(
                      BootstrapIcons.person_fill, 
                      color: Colors.black.withAlpha(150),
                      size: 20,
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              clientSelected != null ? 'Cliente seleccionado' : 'Seleccionar',
                              style: GoogleFonts.quicksand(
                                color: AppTheme.primary,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              clientSelected != null ? clientSelected.name : 'Cliente',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                color: Colors.black.withAlpha(150),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 22,
                        color: Colors.black.withAlpha(150),
                      ),
                      
                    ],
                  ),
                ),
                
              ],
            )
          ),
        ),
      ),
    );

  }

}