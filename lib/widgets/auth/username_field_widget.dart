import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:skeleton/helpers/extensions.dart';


class UsernameFieldWidget extends StatefulWidget {
  const UsernameFieldWidget({
    Key? key,
    required this.controller,
    required this.focus,
  }) : super(key: key);
  final FocusNode focus;
  final TextEditingController controller;

  @override
  State<UsernameFieldWidget> createState() => _UsernameFieldWidgetState();
}

class _UsernameFieldWidgetState extends State<UsernameFieldWidget> {
  String _textUser = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
      child: TextFormField(
        autofocus: false,
        autofillHints: const [AutofillHints.email],
        style: const TextStyle(overflow: TextOverflow.ellipsis),
        controller: widget.controller,
        maxLines: 1,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(widget.focus);
        },
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        validator: _validator,
        onChanged: (text) {
          if (text.isNotEmpty) {
            if (_textUser.endsWith('@')) {
              widget.controller.text = '${text}oftnet.mx';
              setState(() {
                _textUser = '${text}oftnet.mx';
              });
            } else {
              setState(() {
                _textUser = text;
              });
            }
          } else {
            setState(() {
              _textUser = '';
            });
          }
        },
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          labelText: "Correo electronico",
          hintText: "tucorreo@ejemplo.com",
          errorStyle: GoogleFonts.quicksand(color: Colors.red),
          suffixIcon: _textUser.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    setState(() {
                      _textUser = '';
                    });
                    widget.controller.clear();
                  })
              : null,
        ),
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'No puede estar vacío';
    }
    return null;
  }

  
}
