import 'package:ansicolor/ansicolor.dart'; 
import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart'; 

import 'package:flutter_template/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_template/helpers/colorized.dart'; 
import 'package:flutter_template/routes/app_routers.dart'; 
import 'package:flutter_template/services/local_storage.dart';
import 'package:flutter_template/themes/main_theme.dart'; 
import 'injection_container.dart' as di;

void main() async {
  
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {

    debugPrint(colorize(
        '${record.level.name}: ${record.time}: ${record.message}: ${record.loggerName}',
        AnsiPen()..green));
  });

  WidgetsFlutterBinding.ensureInitialized();

  //await Stripe.instance.applySettings();

  await LocalStorage.configurePrefs();
  await di.initLocator();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(AppState());
  
}

class AppState extends StatelessWidget {

  AppState({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthBloc>()..add(IsLoggedIn()),
        ),
      ],
      child: MyApp(
        appRouter: appRouter,
      ),
    );
  }
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
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
