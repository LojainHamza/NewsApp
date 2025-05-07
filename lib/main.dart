import 'package:flutter/material.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/news/my_custom_messages_ar.dart';
import 'package:news_app/ui/home/news/my_custom_messages_en.dart';
import 'package:news_app/ui/home_screen.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  /// Create instances of providers
  final appLanguageProvider = AppLanguageProvider();
  final appThemeProvider = AppThemeProvider();

  /// Load settings from Shared Preferences
  await appLanguageProvider.loadLanguage();
  await appThemeProvider.loadTheme();

  timeago.setLocaleMessages('en', MyCustomMessagesEN());
  timeago.setLocaleMessages('ar', MyCustomMessagesAR());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: themeProvider.appTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: Locale(languageProvider.appLanguage),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
