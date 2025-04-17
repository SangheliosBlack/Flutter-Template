import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/application/providers/forms/client_form.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientDialogAddressField extends ConsumerStatefulWidget {
  const ClientDialogAddressField({super.key});

  @override
  ConsumerState<ClientDialogAddressField> createState() => _ClientDialogAddressFieldState();
}

class _ClientDialogAddressFieldState extends ConsumerState<ClientDialogAddressField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Escucha cuando cambia el cliente seleccionado y actualiza el controller
    ref.listen(
      orderCartProvider.select((state) => state.clientSelected),
      (prev, next) {
        if (next == null) {
          _controller.clear(); // Cliente eliminado
        } else {
          _controller.text = next.address; // Asumiendo que `address` es la propiedad del cliente
        }
      },
    );

    return TextField(
      controller: _controller,
      onChanged: (value) {
        ref.read(clientFormProvider.notifier).updateAddress(value: value);
      },
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 17.0,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        hintStyle: GoogleFonts.poppins(
          color: Colors.grey,
          fontSize: 17.0,
          fontWeight: FontWeight.w300,
        ),
        hintText: "Domicilio",
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        fillColor: const Color.fromRGBO(247, 250, 251, 1),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(50)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(50)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(50)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(50)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
