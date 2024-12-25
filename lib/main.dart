import 'dart:io';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart'; 
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/core/services/background_fetch/background_fetch_service.dart';
import 'package:flutter_web_plugins/url_strategy.dart'; 
import 'core/config/router/app_router.dart';

void main() async {
  

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  usePathUrlStrategy();

  runApp(ProviderScope(child: MainApp()));

  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {

    BackgroundFetch.registerHeadlessTask(BackgroundFetchService.backgroundFetchHeadlessTask);
    
  }

  
}
class MainApp extends ConsumerWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template',
      theme: AppTheme.appTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale('es')],
      routerConfig: appRouter
    );
    
  }

}
