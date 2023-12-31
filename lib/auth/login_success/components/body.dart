import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MySize.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: MySize.screenHeight * 0.4, //40%
        ),
        SizedBox(height: MySize.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: MySize.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              // Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
