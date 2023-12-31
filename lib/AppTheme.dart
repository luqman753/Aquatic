/*
* File : App Theme
* Version : 1.0.0
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const int themeLight = 1;
  static const int themeDark = 2;

  AppTheme._();

  // static CustomAppTheme getCustomAppTheme(int themeMode) {
  //   if (themeMode == themeLight) {
  //     return lightCustomAppTheme;
  //   } else if (themeMode == themeDark) {
  //     return darkCustomAppTheme;
  //   }
  //   return darkCustomAppTheme;
  // }

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w300;
      case 500:
        return FontWeight.w400;
      case 600:
        return FontWeight.w500;
      case 700:
        return FontWeight.w600;
      case 800:
        return FontWeight.w700;
      case 900:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle getTextStyle(TextStyle? textStyle,
      {int fontWeight = 500,
      bool muted = false,
      bool xMuted = false,
      double letterSpacing = 0.15,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    double? finalFontSize = fontSize ?? textStyle!.fontSize;

    Color? finalColor;
    if (color == null) {
      finalColor = xMuted
          ? textStyle!.color!.withAlpha(160)
          : (muted ? textStyle!.color!.withAlpha(200) : textStyle!.color);
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return GoogleFonts.ibmPlexSans(
        fontSize: finalFontSize,
        fontWeight: _getFontWeight(fontWeight),
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  //App Bar Text
  static final TextTheme lightAppBarTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff495057))),
    headline2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff495057))),
    headline3: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff495057))),
    headline4: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff495057))),
    headline5: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff495057))),
    headline6: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff495057))),
    subtitle1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff495057))),
    subtitle2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff495057))),
    bodyText1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff495057))),
    bodyText2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff495057))),
    button: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff495057))),
    caption: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff495057))),
    overline: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff495057))),
  );
  static final TextTheme darkAppBarTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xffffffff))),
    headline2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xffffffff))),
    headline3: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xffffffff))),
    headline4: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xffffffff))),
    headline5: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xffffffff))),
    headline6: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 20, color: Color(0xffffffff))),
    subtitle1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xffffffff))),
    subtitle2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xffffffff))),
    bodyText1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xffffffff))),
    bodyText2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xffffffff))),
    button: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xffffffff))),
    caption: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xffffffff))),
    overline: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xffffffff))),
  );

  //Text Themes
  static final TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff4a4c4f))),
    headline2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff4a4c4f))),
    headline3: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff4a4c4f))),
    headline4: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff4a4c4f))),
    headline5: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff4a4c4f))),
    headline6: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff4a4c4f))),
    subtitle1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff4a4c4f))),
    subtitle2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
    bodyText1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff4a4c4f))),
    bodyText2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff4a4c4f))),
    button: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
    caption: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff4a4c4f))),
    overline: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff4a4c4f))),
  );
  static final TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 102, color: Colors.white)),
    headline2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 64, color: Colors.white)),
    headline3: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 51, color: Colors.white)),
    headline4: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 36, color: Colors.white)),
    headline5: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 25, color: Colors.white)),
    headline6: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 18, color: Colors.white)),
    subtitle1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 17, color: Colors.white)),
    subtitle2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
    bodyText1: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
    bodyText2: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 14, color: Colors.white)),
    button: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
    caption: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 13, color: Colors.white)),
    overline: GoogleFonts.ibmPlexSans(
        textStyle: const TextStyle(fontSize: 11, color: Colors.white)),
  );

  //Color Themes
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromRGBO(10, 183, 131, 1),
    canvasColor: Colors.transparent,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xffffffff),
    appBarTheme:const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Color(0xff495057),
      ),
      color: Color(0xffffffff),
      iconTheme: IconThemeData(color: Color(0xff495057), size: 24),
    ),
    navigationRailTheme:  const NavigationRailThemeData(
        selectedIconTheme:
            IconThemeData(color: Color(0xff3d63ff), opacity: 1, size: 24),
        unselectedIconTheme:
            IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
        backgroundColor: Color(0xffffffff),
        elevation: 3,
        selectedLabelTextStyle: TextStyle(color: Color(0xff3d63ff)),
        unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
    colorScheme: const ColorScheme.light(
        primary: Color(0xFF319750),
        onPrimary: Colors.white,
        primaryContainer: Color(0xff0055ff),
        secondary: Color(0xff495057),
        secondaryContainer: Color(0xFF319750),
        onSecondary: Colors.white,
        surface: Color(0xffe2e7f1),
        background: Color(0xfff3f4f7),
        onBackground: Color(0xff495057)),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.4),
      elevation: 1,
      margin: const EdgeInsets.all(0),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.only(top: 0, bottom: 0),
      hintStyle: TextStyle(fontSize: 15, color: Color(0xaa495057)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Color(0xFF319750)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.black54),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(width: 1, color: Colors.black54)),
    ),
    splashColor: Colors.white.withAlpha(100),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: lightTextTheme,
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffdcc7ff),
    highlightColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xFF319750),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: const Color(0xff3d63ff),
        hoverColor: const Color(0xff3d63ff),
        foregroundColor: Colors.white),
    dividerColor: const Color(0xffd1d1d1),
    errorColor: const Color(0xfff0323c),
    cardColor: Colors.white,
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xffffffff),
      textStyle:
          lightTextTheme.bodyText2!.merge(const TextStyle(color: Color(0xff495057))),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xFF319750),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xff3d63ff),
      inactiveTrackColor: const Color(0xff3d63ff).withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xff3d63ff),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    canvasColor: Colors.transparent,
    primaryColor: const Color(0xFF319750),
    scaffoldBackgroundColor: const Color(0xff464c52),
    backgroundColor: const Color(0xff464c52),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Color(0xffffffff),
      ),
      color: Color(0xff2e343b),
      iconTheme: IconThemeData(color: Color(0xffffffff), size: 24),
    ),
    colorScheme: const ColorScheme.dark(
      primary:  Color(0xff3d63ff),
      primaryContainer:  Color(0xff3d63ff),
      secondary:  Color(0xff00cc77),
      secondaryContainer:  Color(0xff00cc77),
      background:  Color(0xff343a40),
      onPrimary: Colors.white,
      onBackground: Colors.white,
      onSecondary: Colors.white,
      surface:  Color(0xff585e63),
    ),
    cardTheme: const CardTheme(
      color: Color(0xff37404a),
      shadowColor:  Color(0xff000000),
      elevation: 1,
      margin:  EdgeInsets.all(0),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: darkTextTheme,
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffa3a3a3),
    highlightColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius:  BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(width: 1, color: Color(0xff3d63ff)),
      ),
      enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide:  BorderSide(width: 1, color: Colors.white70),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all( Radius.circular(10)),
          borderSide:  BorderSide(width: 1, color: Colors.white70)),
    ),
    dividerColor: const Color(0xffd1d1d1),
    errorColor: Colors.orange,
    cardColor: const Color(0xff282a2b),
    splashColor: Colors.white.withAlpha(100),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xff3d63ff),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: const Color(0xff3d63ff),
        hoverColor: const Color(0xff3d63ff),
        foregroundColor: Colors.white),
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xff37404a),
      textStyle:
          lightTextTheme.bodyText2!.merge(const TextStyle(color: Color(0xffffffff))),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: const Color(0xff495057),
      labelColor:  Color(0xff3d63ff),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide:  BorderSide(color: Color(0xff3d63ff), width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xff3d63ff),
      inactiveTrackColor: const Color(0xff3d63ff).withAlpha(100),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xff3d63ff),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(),
  );

  static ThemeData getThemeFromThemeMode(int themeMode) {
    if (themeMode == themeLight) {
      return lightTheme;
    } else if (themeMode == themeDark) {
      return darkTheme;
    }
    return lightTheme;
  }

  // static NavigationBarTheme getNavigationThemeFromMode(int themeMode) {
  //   print(themeMode);
  //   NavigationBarTheme navigationBarTheme = NavigationBarTheme();
  //   if (themeMode == themeLight) {
  //     navigationBarTheme.backgroundColor = Colors.white;
  //     navigationBarTheme.selectedItemColor = Color(0xFF0B6922);
  //     navigationBarTheme.unselectedItemColor = Color(0xff495057);
  //     navigationBarTheme.selectedOverlayColor = Color(0xAB9EE0A3);
  //   } else if (themeMode == themeDark) {
  //     navigationBarTheme.backgroundColor = Color(0xff37404a);
  //     navigationBarTheme.selectedItemColor = Color(0xff37404a);
  //     navigationBarTheme.unselectedItemColor = Color(0xFFD1BABA);
  //     navigationBarTheme.selectedOverlayColor = Color(0xffffffff);
  //   }
  //   return navigationBarTheme;
  // }
}

// class CustomAppTheme {
//   final Color bgLayer1,
//       bgLayer2,
//       bgLayer3,
//       bgLayer4,
//       disabledColor,
//       onDisabled,
//       colorInfo,
//       colorWarning,
//       colorSuccess,
//       colorError,
//       shadowColor,
//       onInfo,
//       onWarning,
//       onSuccess,
//       onError;

//   CustomAppTheme({
//     this.bgLayer1 = const Color(0xffffffff),
//     this.bgLayer2 = const Color(0xFF428847),
//     this.bgLayer3 = const Color(0xffeef2fa),
//     this.bgLayer4 = const Color(0xffdcdee3),
//     this.disabledColor = const Color(0xffdcc7ff),
//     this.onDisabled = const Color(0xffffffff),
//     this.colorWarning = const Color(0xffffc837),
//     this.colorInfo = const Color(0xffff784b),
//     this.colorSuccess = const Color(0xff3cd278),
//     this.shadowColor = const Color(0xff1f1f1f),
//     this.onInfo = const Color(0xffffffff),
//     this.onWarning = const Color(0xffffffff),
//     this.onSuccess = const Color(0xffffffff),
//     this.colorError = const Color(0xfff0323c),
//     this.onError = const Color(0xffffffff),
//   });
// }

// class NavigationBarTheme {
//   Color? backgroundColor,
//       selectedItemIconColor,
//       selectedItemTextColor,
//       selectedItemColor,
//       selectedOverlayColor,
//       unselectedItemIconColor,
//       unselectedItemTextColor,
//       unselectedItemColor;
// }
