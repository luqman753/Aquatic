import 'package:flutter/material.dart';

import 'components/body.dart';

class PreSignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const PreSignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Body(),
      ),
    );
  }
}
