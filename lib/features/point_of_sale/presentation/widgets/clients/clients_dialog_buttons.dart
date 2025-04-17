import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/clients/application/providers/providers.dart';
import 'package:flutter_template/features/point_of_sale/application/providers/forms/client_form.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:flutter_template/features/shared/presentation/widgets/buttons/sb_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientsDialogButtons extends ConsumerWidget {

  final bool addInmediately;

  const ClientsDialogButtons({
    super.key,
    required this.addInmediately
  });

  @override
  Widget build(BuildContext context,ref) {
    
    final bool formStatusIsValid = ref.watch(clientFormProvider).isValid;

    final clientSelected = ref.watch(orderCartProvider).clientSelected;
    
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,horizontal: 20
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withAlpha(50),
            width: 1,
          )
        ),
        color: Color.fromRGBO(250,250,250	, 1)
      ),
      child: Row(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SbButton(
            color: Colors.white,
            title: 'Cancelar',
            onTap: () {

              ref.read(orderCartProvider.notifier).removeClient();

              Navigator.pop(context);
              
            },
            textStyle: GoogleFonts.quicksand(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
          SbButton(
            color: formStatusIsValid ?  AppTheme.primary: Colors.grey,
            borderRadius: BorderRadius.circular(5),
            textStyle: GoogleFonts.quicksand(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
            title: clientSelected != null ? "Agregar a la orden" : 'Guardar',
            onTap: formStatusIsValid ? () { 

              if(clientSelected == null){

                ref.read(clientsProvider.notifier).addClient(addInmediately: addInmediately);

              }

              context.pop();

            } : null, 
          )
        ],
      ),
    );

  }

}