import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/clients/application/providers/providers.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchClientWidget extends ConsumerWidget {

  const SearchClientWidget({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final clientSelected = ref.watch(orderCartProvider).clientSelected;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25
      ),
      child: Row(
        children: [
          Icon(BootstrapIcons.search),
          Expanded(
            child: TextField(
              
              onChanged: (value){

                ref.read(clientsProvider.notifier).getClientByPhone(phone: value.replaceAll(" ", "").trim());

              },
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w300
              ),
              decoration: InputDecoration(
                hintStyle: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 17.0,
                fontWeight: FontWeight.w300
              ),
              suffixIcon: clientSelected != null ? IconButton(
                icon: Icon(BootstrapIcons.x_circle, color: Colors.grey),
                onPressed: () {

                  ref.read(clientsProvider.notifier).getClientByPhone(phone: "");

                }
                ,
              ) : null,
                hintText: "Nombre, Telefono, Direccion",
                filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withAlpha(0)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withAlpha(0)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withAlpha(0)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withAlpha(0)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withAlpha(0)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
          ),
        ],
      ),
    );

  }

}