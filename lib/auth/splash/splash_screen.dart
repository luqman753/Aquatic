import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/SplashScreen.dart';
import '../../components/user_bottom_nav_bar.dart';
import '../../size_config.dart';
import '../pre_sign_in/pre_sign_in_screen.dart';


class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  Future<dynamic> loadFromFuture(context) async {
    // <fetch data from server. ex. login>
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 3), () {
      if (prefs.getString("role").toString() == "Admin") {
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => Admin()));
      } else if (prefs.getString("role").toString() == "User") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => User()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>const  PreSignInScreen()));
      }
    });

    // var response = await Future.delayed(Duration(seconds: 3), () {
    //   return Future.value("/dashboard");
    // });
    // return response;
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return  SplashScreen(
      navigateAfterFuture: loadFromFuture(context),
      title:  Text(
        'Aquatic Shipping Xpress',
        style:  TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MySize.size26,
          color: Colors.green.shade600,
        ),
      ),
      image:  Image.asset('assets/icons/logo.png'),
      // backgroundColor: ThemeData().colorScheme.background,
      styleTextUnderTheLoader: const TextStyle(),
      photoSize: MySize.size100,
      // loaderColor: Colors.green,
    );
  }
}
