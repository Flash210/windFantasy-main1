import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/core/services/router.dart';
import 'package:front/features/authentification/ViewModel/auth_provider.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:front/features/fantasy/ViewModel/show_team_provider.dart';
import 'package:front/features/fantasy/ViewModel/team_edit_provider.dart';
import 'package:front/features/filter/ViewModel/filter_provider.dart';
import 'package:front/features/langauge/provider.dart';
import 'package:front/features/ranking/ViewModel/ranking_provider.dart';
import 'package:front/generated/l10n.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<LanguageProvider>()),
        ChangeNotifierProvider(
          create: (context) => sl<AuthProvider>(),
        ),
        ChangeNotifierProvider(create: (context) => sl<RankingProvider>()),
        ChangeNotifierProvider(create: (context) => sl<PlayerProvider>()),
        ChangeNotifierProvider(create: (context) => sl<TeamEditProvider>()),
        ChangeNotifierProvider(create: (context) => sl<FilterProvider>()),
        ChangeNotifierProvider(create: (context) => sl<ShowTeamProvider>()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue, primaryColor: Colors.black),
            locale: languageProvider.appLanguage == AppLanguage.French
                ? const Locale('fr', 'FR')
                : const Locale('en', 'US'),
            localizationsDelegates: const [
              //AppLocalizations.delegate,
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('fr', 'FR'),
            ],
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
