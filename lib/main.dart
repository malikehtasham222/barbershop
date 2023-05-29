import 'package:barbershop_new/l10n/l10n.dart';
import 'package:barbershop_new/src/helpers/constants.dart';
import 'package:barbershop_new/src/helpers/routes.dart';
import 'package:barbershop_new/src/helpers/themes.dart';
import 'package:barbershop_new/src/providers/locale_provider.dart';
import 'package:barbershop_new/src/providers/theme_provider.dart';
import 'package:barbershop_new/src/providers/util_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => UtilProvider()),
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, localeProv, themeProv, snapshot) {
          return GetMaterialApp(
            title: 'Barbara',
            debugShowCheckedModeBanner: false,
            theme: themeLight(context),
            darkTheme: themeDark(context),
            locale: localeProv.locale,
            supportedLocales: L10n.all,
            getPages: allPages,
            initialRoute: Routes.splash,
            themeMode: (themeProv.isDarkTheme == true)
                ? ThemeMode.dark
                : ThemeMode.light,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
