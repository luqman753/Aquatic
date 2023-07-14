import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


import '../user/Shopping/Shopping.dart';
import '../user/address/address.dart';
import '../user/home/home_screen.dart';
import '../user/profile/profile_screen.dart';
import '../user/shipping/Shipping.dart';
import 'CustomBottomNavigation.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  int _currentIndex = 0;
  ThemeData? themeData;
  PageController? _pageController;

  // ignore: prefer_typing_uninitialized_variables
  var navigationBarTheme;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    // navigationBarTheme = AppTheme.getNavigationThemeFromMode(2);
    navigationBarTheme = themeData!.bottomNavigationBarTheme;

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(),
            Shipping(),
            const Address(),
            Shopping(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        animationDuration: const Duration(milliseconds: 350),
        // selectedItemOverlayColor: navigationBarTheme!.selectedOverlayColor,
        backgroundColor: navigationBarTheme!.backgroundColor,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: <CustomBottomNavigationBarItem>[
          CustomBottomNavigationBarItem(
              title: "Home",
              icon: const Icon(MdiIcons.storeOutline, size: 22),
              activeIcon: const Icon(MdiIcons.store, size: 22),
              activeColor: navigationBarTheme!.selectedItemColor,
              inactiveColor: navigationBarTheme!.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Shipping",
              icon: const Icon(MdiIcons.truckOutline, size: 22),
              activeIcon: const Icon(MdiIcons.truck, size: 22),
              activeColor: navigationBarTheme!.selectedItemColor,
              inactiveColor: navigationBarTheme!.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Address",
              icon: const Icon(MdiIcons.viewListOutline, size: 22),
              activeIcon: const Icon(MdiIcons.viewList, size: 22),
              activeColor: navigationBarTheme!.selectedItemColor,
              inactiveColor: navigationBarTheme!.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Products",
              icon: const Icon(Icons.shop_2_outlined, size: 22),
              activeIcon: const Icon(Icons.shop_2, size: 22),
              activeColor: navigationBarTheme!.selectedItemColor,
              inactiveColor: navigationBarTheme!.unselectedItemColor),
          CustomBottomNavigationBarItem(
              title: "Profile",
              icon: const Icon(MdiIcons.accountOutline, size: 22),
              activeIcon: const Icon(MdiIcons.account, size: 22),
              activeColor: navigationBarTheme!.selectedItemColor,
              inactiveColor: navigationBarTheme!.unselectedItemColor),
        ],
      ),
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
