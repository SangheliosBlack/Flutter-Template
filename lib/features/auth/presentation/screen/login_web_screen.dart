import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/constants/constants.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_template/features/auth/presentation/widgets/widgets.dart';
import 'package:flutter_template/features/features_screens.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';


class LoginScreen extends ConsumerWidget {

  static String path = "/auth/login";
  
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context,ref) {

    final authData = ref.watch(authProvider);

    return Title(
      key: ValueKey("authLogin"),
      color: Colors.red,
      title: "Iniciar sesión",
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ResponsiveBuilder(builder: (BuildContext context, SizingInformation sizingInformation) {
                return Container(
                  width: sizingInformation.isDesktop || sizingInformation.isTablet ? context.width * .5 >= 500 ? 500 : context.width * .5 : context.width,
                  padding: EdgeInsets.symmetric(
                  horizontal: sizingInformation.isMobile ? 30 : 0),
                  height: context.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        UiConstants.appName,
                        style: GoogleFonts.quicksand(
                          height: 1,
                          color: Colors.black,
                          fontSize: sizingInformation.isDesktop ? 60 : 50
                        ),
                      ),
                      LoginForm(
                        formKey: _formKey
                      ),
                      Column(
                        children: [
                          AdaptativeButton(
                            key:  ValueKey("${UiConstants.loginButtonText}1"),
                            labelText: UiConstants.loginButtonText, 
                            isLoading: authData.isLoading,
                            onTap: () async {
                          
                              FocusScope.of(context).unfocus();
                          
                              if (!_formKey.currentState!.validate()) return;
                          
                              ref.read(authProvider.notifier).login();
                          
                            }, 
                          ),
                          ErrorAuthWidget(),
                        ],
                      ),
                      NewAccount()
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
