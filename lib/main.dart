// Importaciones de paquetes externos necesarios
import 'package:ansicolor/ansicolor.dart'; // Para colorear la salida en la consola
import 'package:flutter/material.dart'; // Para la creación de la interfaz de usuario
import 'package:flutter/services.dart'; // Para el manejo de servicios del sistema
import 'package:flutter_bloc/flutter_bloc.dart'; // Para la implementación de patrón BLoC
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Para cargar variables de entorno desde un archivo .env
import 'package:flutter_localizations/flutter_localizations.dart'; // Para la internacionalización de la aplicación
import 'package:flutter_stripe/flutter_stripe.dart'; // Para integración con Stripe
import 'package:logging/logging.dart'; // Para la gestión de registros y logs

// Importaciones de archivos y carpetas locales
import 'package:flutter_template/blocs/auth_bloc/auth_bloc.dart'; // Bloc para la gestión de autenticación
import 'package:flutter_template/helpers/colorized.dart'; // Utilidad para colorear texto en consola
import 'package:flutter_template/routes/app_routers.dart'; // Configuración de las rutas de la aplicación
import 'package:flutter_template/services/local_storage.dart'; // Servicio para el manejo de almacenamiento local
import 'package:flutter_template/themes/main_theme.dart'; // Configuración del tema de la aplicación
import 'injection_container.dart' as di; // Contenedor de dependencias para la inyección de dependencias

// Punto de entrada principal de la aplicación
void main() async {
  // Configuración del nivel de registro y la salida de logs en la consola
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print(colorize(
        '${record.level.name}: ${record.time}: ${record.message}: ${record.loggerName}',
        AnsiPen()..green));
  });

  // Carga de variables de entorno desde un archivo .env
  await dotenv.load(fileName: ".env");

  // Inicialización del sistema Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Configuración de la clave de API de Stripe
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHED_KEY']!;
  await Stripe.instance.applySettings();

  // Configuración del almacenamiento local y la inyección de dependencias
  await LocalStorage.configurePrefs();
  await di.initLocator();

  // Configuración de la orientación de la pantalla
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Ejecución de la aplicación principal
  runApp(AppState());
}

// Clase principal de la aplicación que extiende StatelessWidget
class AppState extends StatelessWidget {
  AppState({super.key});

  // Instancia del enrutador de la aplicación
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // Proveedor de BLoCs múltiples para la gestión del estado
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthBloc>()..add(IsLoggedIn()),
        ),
      ],
      // Construcción de la aplicación principal
      child: MyApp(
        appRouter: appRouter,
      ),
    );
  }
}

// Clase principal de la aplicación que extiende StatelessWidget
class MyApp extends StatelessWidget {
  // Enrutador de la aplicación pasado como parámetro
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    // Construcción de la aplicación utilizando MaterialApp con enrutador personalizado
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template',
      theme: Themes.appTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('es')],
      routerConfig: appRouter.config(),
    );
  }
}
