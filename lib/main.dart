import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:localization_test/AppLocalization.dart';

import 'HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

Locale? _locale;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/lang'];
    return MaterialApp(
      locale: _locale,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (_locale != null &&
            _locale!.languageCode.split("_")[0] ==
                supportedLocales.first.languageCode) {
          return supportedLocales.first;
        } else if (_locale != null &&
            _locale!.languageCode.split("_")[0] ==
                supportedLocales.last.languageCode) {
          return supportedLocales.last;
        } else if (_locale != null &&
            _locale!.languageCode.split("_")[0] !=
                supportedLocales.last.languageCode &&
            _locale!.languageCode.split("_")[0] !=
                supportedLocales.first.languageCode) {
          return supportedLocales.last;
        } else {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode) {
              return supportedLocales.first;
            }
          }
        }
        return supportedLocales.first;
      },
      home: HomeScreen(),
    );
  }
}
