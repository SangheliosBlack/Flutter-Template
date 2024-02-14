import 'package:flutter/material.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:flutter_template/views/auth/steps/first.dart';
import 'package:flutter_template/views/auth/steps/second.dart';
import 'package:flutter_template/views/auth/steps/third.dart';

class RegisterPage extends StatefulWidget {
  final PageController pageController;
  const RegisterPage({super.key, required this.pageController});

  @override
  State<RegisterPage> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterPage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        height: context.height,
        child: PageView(
          onPageChanged: (e) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            FirstStep(
              pageController: pageController,
              pastController: widget.pageController,
            ),
            SecondStep(
              pageController: pageController,
            ),
            LastStep(
              pageController: pageController,
            )
          ],
        ));
  }
}
