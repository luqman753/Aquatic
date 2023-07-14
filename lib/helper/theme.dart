import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var primaryColor = const Color(0xFF319750);
var darkScaffoldBackgroundColor =const Color.fromRGBO(24, 24, 24, 1.0);
var darkCardBackgroundColor =const Color.fromRGBO(37, 37, 37, 1.0);
var darkNavOverlayColor = primaryColor.withOpacity(0.2);
var lightNavOverlayColor = primaryColor.withOpacity(0.2);
var lightScaffoldBackgroundColor =const Color.fromRGBO(223, 230, 233, 1.0);
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryColor,
    unselectedItemColor: const Color(0xff495057),

    //  :Color(0xAB9EE0A3)
  ),
  primaryColor: primaryColor,
  canvasColor: Colors.transparent,
  backgroundColor: Colors.grey.shade200,
  scaffoldBackgroundColor: lightScaffoldBackgroundColor,
  appBarTheme: AppBarTheme(
    color: primaryColor,
    centerTitle: true,
  ),
  navigationRailTheme:const NavigationRailThemeData(
    selectedIconTheme:
        IconThemeData(color: Color(0xff3d63ff), opacity: 1, size: 24),
    unselectedIconTheme:
        IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
    backgroundColor: Color(0xffffffff),
    elevation: 3,
    selectedLabelTextStyle: TextStyle(color: Color(0xff3d63ff)),
    unselectedLabelTextStyle: TextStyle(
      color: Color(0xff495057),
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: primaryColor,
    onPrimary: Colors.white,
    primaryContainer:const Color(0xff0055ff),
    secondary:const Color(0xff495057),
    secondaryContainer: primaryColor,
    onSecondary: Colors.white,
    surface: const Color(0xffe2e7f1),
    background: const Color(0xfff3f4f7),
    onBackground:const Color(0xff495057),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.black.withOpacity(0.4),
    elevation: 5,
    margin:const EdgeInsets.all(0),
  ),
  inputDecorationTheme:const  InputDecorationTheme(
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
  iconTheme: const IconThemeData(color: Colors.black87),
  indicatorColor: Colors.white,
  disabledColor:const Color(0xffdcc7ff),
  highlightColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor:const Color(0xFF319750),
      splashColor: Colors.white.withAlpha(100),
      highlightElevation: 8,
      elevation: 4,
      focusColor:const Color(0xff3d63ff),
      hoverColor:const Color(0xff3d63ff),
      foregroundColor: Colors.white),
  dividerColor:const Color(0xffd1d1d1),
  errorColor:const Color(0xfff0323c),
  cardColor: Colors.white,
  bottomAppBarTheme:
      BottomAppBarTheme(color: lightNavOverlayColor, elevation: 2),
  tabBarTheme:const TabBarTheme(
    unselectedLabelColor: Color(0xff495057),
    labelColor: Color(0xFF319750),
    indicatorSize: TabBarIndicatorSize.label,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
    ),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor:const Color(0xff3d63ff),
    inactiveTrackColor:const Color(0xff3d63ff).withAlpha(140),
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

ThemeData darkMode = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black54,
    selectedItemColor: primaryColor,
    unselectedItemColor: const Color(0xFFD1BABA),
  ),
  brightness: Brightness.dark,
  canvasColor: Colors.transparent,
  primaryColor: const Color(0xFF319750),
  scaffoldBackgroundColor: darkScaffoldBackgroundColor,
  backgroundColor: const Color(0xFF2C2E30),
  appBarTheme: AppBarTheme(
    color: primaryColor,
    centerTitle: true,
  ),
  colorScheme: ColorScheme.dark(
    primary: primaryColor,
    primaryContainer: primaryColor,
    secondary: primaryColor,
    secondaryContainer: primaryColor,
    background: const Color(0xff343a40),
    onPrimary: Colors.white,
    onBackground: Colors.white,
    onSecondary: Colors.white,
    surface: const Color(0xff585e63),
  ),
  cardTheme: CardTheme(
    color: darkCardBackgroundColor,
    shadowColor: const Color(0xff000000),
    elevation: 1,
    margin: const EdgeInsets.all(0),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  indicatorColor: Colors.white,
  disabledColor: const Color(0xffa3a3a3),
  highlightColor: Colors.white,
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder:  OutlineInputBorder(
      borderRadius:  BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 1, color: Color(0xFF319750)),
    ),
    enabledBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 1, color: Colors.white70),
    ),
    border: OutlineInputBorder(
        borderRadius:  BorderRadius.all( Radius.circular(10)),
        borderSide:  BorderSide(width: 1, color: Colors.white70)),
  ),
  dividerColor: const Color(0xffd1d1d1),
  errorColor: Colors.orange,
  cardColor: darkCardBackgroundColor,
  splashColor: Colors.white.withAlpha(100),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color(0xff3d63ff),
      splashColor: Colors.white.withAlpha(100),
      highlightElevation: 8,
      elevation: 4,
      focusColor: const Color(0xff3d63ff),
      hoverColor: const Color(0xff3d63ff),
      foregroundColor: Colors.white),
  bottomAppBarTheme:
      BottomAppBarTheme(color: darkNavOverlayColor, elevation: 2),
  tabBarTheme: const TabBarTheme(
    unselectedLabelColor: Color(0xff495057),
    labelColor: Color(0xFF319750),
    indicatorSize: TabBarIndicatorSize.label,
    indicator:  UnderlineTabIndicator(
      borderSide: BorderSide(color: Color(0xFF319750), width: 2.0),
    ),
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: const Color(0xFF319750),
    inactiveTrackColor: const Color(0xFF319750).withAlpha(100),
    trackShape: const RoundedRectSliderTrackShape(),
    trackHeight: 4.0,
    thumbColor: const Color(0xFF319750),
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

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _preferences;
  late bool _darkMode;

  bool get darkMode => _darkMode;

  ThemeNotifier() {
    _darkMode = false;
    _loadFromPreferences();
  }

  _initialPreferences() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  _savePreferences() async {
    await _initialPreferences();
    _preferences!.setBool(key, _darkMode);
  }

  _loadFromPreferences() async {
    await _initialPreferences();
    _darkMode = _preferences!.getBool(key) ?? false;
    notifyListeners();
  }

  toggleChangeTheme() {
    _darkMode = !_darkMode;
    _savePreferences();
    notifyListeners();
  }
}
