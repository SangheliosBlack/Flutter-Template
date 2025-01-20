import 'package:flutter/material.dart';
import 'package:flutter_template/helpers/extensions.dart';

class CoolDataTableError extends StatelessWidget {

  final Exception exception;
  final String library;
  final ErrorDescription contextDesc;


  const CoolDataTableError({
    super.key, 
    required this.exception, 
    required this.contextDesc, 
    required this.library
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: context.height - 70,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ErrorWidget.builder(
              FlutterErrorDetails(
                exception: exception,
                library: library,
                context: contextDesc,
              ),
            ),
          ],
        ),
      ),
    );

  }

}