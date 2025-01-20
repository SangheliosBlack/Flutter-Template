// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/local_storage/local_storage_provider.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('Simular login con interacción visible', (tester) async {

     final localStorageService = ProviderContainer().read(localStorageServiceProvider);

     print("Iniciando la prueba de login");

      // Limpia el almacenamiento antes de comenzar la prueba
      await localStorageService.clear();

      // Espera a que todo esté estable
      await tester.pumpAndSettle();
      
      // Carga la aplicación principal.
      await tester.pumpWidget(
        ProviderScope(
          child: const MainApp(),
        ),
      );

      // Espera a que todo esté estable.
      await tester.pumpAndSettle();

      // Verifica que el Splash Screen ya no está
      expect(find.byKey(const ValueKey('splashScreen')), findsNothing);

      // Verifica que la pantalla principal (home) está presente
      expect(find.byKey(const ValueKey('welcomeScreen')), findsOneWidget);

      // Presiona el botón de login
      expect(find.byKey(const ValueKey('loginButton')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('loginButton')));

      // Espera un poco para observar la transición
      await Future.delayed(const Duration(milliseconds:400));
      await tester.pumpAndSettle();

      // Verifica que se navega a la pantalla de autenticación
      expect(find.byKey(const ValueKey('authLogin')), findsOneWidget);

      // Interactúa con el campo de email
      expect(find.byKey(const ValueKey('emailField')), findsOneWidget);
      await tester.enterText(
        find.byKey(const ValueKey('emailField')), 
        'julio.villagrana.sanghelios22@gmail.com',
      );

      // Espera para visualizar la entrada de texto
      await Future.delayed(const Duration(milliseconds: 400));
      await tester.pump();

      // Verifica que el texto fue ingresado correctamente
      expect(find.text('julio.villagrana.sanghelios22@gmail.com'), findsOneWidget);

      // Interactúa con el campo de contraseña
      expect(find.byKey(const ValueKey('passwordField')), findsOneWidget);

      await tester.enterText(
        find.byKey(const ValueKey('passwordField')), 
        'Jamon2011',
      );

      // Espera para visualizar la entrada de texto
      await Future.delayed(const Duration(milliseconds: 400));
      await tester.pump();

      // Verifica que el texto fue ingresado correctamente
      expect(find.text('Jamon2011'), findsOneWidget);

      expect(find.byKey(const ValueKey('Iniciar sesion1')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('Iniciar sesion1')));

      // Espera un poco para observar la transición
      await Future.delayed(const Duration(milliseconds:400));
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey('poScreen')), findsOneWidget);

      localStorageService.clear();

    });
  });
}
