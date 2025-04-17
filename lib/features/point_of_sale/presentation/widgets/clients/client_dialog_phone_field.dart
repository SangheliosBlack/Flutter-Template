import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/application/providers/forms/client_form.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientDialogPhoneField extends ConsumerStatefulWidget {
  const ClientDialogPhoneField({super.key});

  @override
  ConsumerState<ClientDialogPhoneField> createState() => _ClientDialogPhoneFieldState();
}

class _ClientDialogPhoneFieldState extends ConsumerState<ClientDialogPhoneField> {
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
    ref.listen(
      orderCartProvider.select((state) => state.clientSelected),
      (prev, next) {
        if (next == null) {
          _controller.clear();
        } else {
          _controller.text = formatPhoneNumber(next.phone );
        }
      },
    );

    return TextField(
      controller: _controller,
      onChanged: (value) {
        ref.read(clientFormProvider.notifier).updatePhone(value: value.replaceAll(' ', ''));
      },
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        TextInputFormatter.withFunction((oldValue, newValue) {
          final text = newValue.text.replaceAll(' ', '');
          final buffer = StringBuffer();

          for (int i = 0; i < text.length; i++) {
            if (i == 3 || i == 6) buffer.write(' ');
            buffer.write(text[i]);
          }

          return TextEditingValue(
            text: buffer.toString(),
            selection: TextSelection.collapsed(offset: buffer.length),
          );
        }),
      ],
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
        hintText: "Telefono celular",
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

  String formatPhoneNumber(String phone) {
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length && i < 10; i++) {
      if (i == 3 || i == 6) buffer.write(' ');
      buffer.write(digits[i]);
    }

    return buffer.toString();
  }
}
