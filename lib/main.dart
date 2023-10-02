import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:skeleton/blocs/auth_bloc/auth_bloc.dart';
import 'package:skeleton/routes/app_routers.dart';
import 'package:skeleton/services/local_storage.dart';
import 'package:skeleton/themes/main_theme.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  await di.initLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  runApp( AppState());
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
      title: 'Flutter Demo',
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
