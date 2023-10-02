
import 'package:flutter/material.dart';
import 'package:skeleton/helpers/extensions.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String _textUser = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
      child: TextFormField(
        style: const TextStyle(overflow: TextOverflow.ellipsis),
        autofocus: false,
        controller: widget.controller,
        maxLines: 1,
        keyboardType: widget.keyboardType,
        textInputAction: TextInputAction.next,
        validator: _validator,
        onChanged: (text) {
          if (text.isNotEmpty) {
            setState(() {
              _textUser = text;
            });
          } else {
            setState(() {
              _textUser = '';
            });
          }
        },
        decoration: InputDecoration(
          labelText: widget.labelText,
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
