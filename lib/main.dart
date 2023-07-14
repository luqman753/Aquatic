import 'dart:io';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stable_aquatic/helper/theme.dart';
import 'package:stable_aquatic/models/GeneralProvider.dart';

import 'auth/splash/splash_screen.dart';


void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GeneralProvider()),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ],
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aquatic Xpress Shipping',
          theme: notifier.darkMode ? darkMode : lightMode,
          
          home: SplashScreenView(),
        );
      }),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
