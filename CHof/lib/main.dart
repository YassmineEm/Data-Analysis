import 'package:auto_size_text/auto_size_text.dart';
import 'package:chiclet/chiclet.dart';
import 'package:e_esg/AccountType.dart';
import 'package:e_esg/Widgets/NavigationBarDoctor.dart';
import 'package:e_esg/Widgets/pulse_animation.dart';
import 'package:e_esg/e_esj.dart';
import 'package:e_esg/main.dart';
import 'package:e_esg/pages/espacejeune/DossierMedical/DocMedical.dart';
import 'package:e_esg/pages/espacejeune/SideBar/SidebarController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:e_esg/pages/IES/espace_admin.dart';

import 'ChoosLanguage.dart';

void main() {
  runApp(const SideBarController());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('fr');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('ar'),
        Locale('fr'),
        Locale('en')
      ],
      debugShowCheckedModeBanner: false,
      home:const NavbarDoc(),
    );
  }
}