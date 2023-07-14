import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../AppTheme.dart';
import '../../../components/cust_bottom_nav_bar.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../models/GeneralProvider.dart';
import '../../../models/SharedPref.dart';
import '../../../size_config.dart';
import '../../forgot_password/forgot_password_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  ThemeData? themeData;
  bool internet = true;

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;

  final List<String> errors = [];
  void loginUser() async {
    String link = "${getCloudUrl()}/api/Auth/login";
    // "https://devapi.aquaticxpressshipping.com/api/Auth/login";
    // "${getCloudUrl()}​/api​/ShipmentOrder​/getfedexorderlist";
    FocusScope.of(context).unfocus();

    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      // print(loginUrl);
      try {
        // UIBlock.block(context);
        var response = await http.post(
          Uri.parse(link),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(<String, dynamic>{
            "username": usernameController.text.toLowerCase(),
            "password": passwordController.text
          }),
        );

        if (response.statusCode == 200) {
          isLoading = false;
          var jsonresponse = json.decode(response.body);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("name", jsonresponse['name']);
          prefs.setString("token", jsonresponse["enToken"]);
          prefs.setString("userName", jsonresponse["userName"]);
          prefs.setString("role", jsonresponse["role"]);

          // ignore: use_build_context_synchronously
          Provider.of<GeneralProvider>(context, listen: false).name =
              jsonresponse['name'];
          // ignore: use_build_context_synchronously
          Provider.of<GeneralProvider>(context, listen: false).userName =
              jsonresponse['userName'];
          if (jsonresponse["role"] == 'Admin') {
            // ignore: use_build_context_synchronously
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (context) => Admin()),
            //     (Route<dynamic> route) => false);
          } else {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const User()),
                (Route<dynamic> route) => false);
          }
        } else {
          isLoading = false;

          // UIBlock.unblock(context);
          if (response.statusCode == 502) {
            // ignore: use_build_context_synchronously
            Flushbar(
              title: "Invalid URL",
              message: "Bad Gateaway",
              duration:const Duration(seconds: 3),
            ).show(context);
          } else {
            //var responseJson = json.decode(response.body);
            // ignore: use_build_context_synchronously
            Flushbar(
              title: "Incorrect Credentials",
              message: "Please Enter Valid Email and Password",
              duration:const Duration(seconds: 3),
            ).show(context);
          }
        }
      } on TimeoutException {
        isLoading = false;

        // UIBlock.unblock(context);

        Flushbar(
          title: "Request Timeout",
          message: "Server does not respond, Please Try Again!",
          duration:const  Duration(seconds: 3),
        ).show(context);
      } on SocketException catch (e) {
        // UIBlock.unblock(context);
        isLoading = false;

        internet = false;
      //  / print('Socket Error: $e');
        setState(() {});
      } catch (e) {
        isLoading = false;

        // UIBlock.unblock(context);

        Flushbar(
          title: "Incorrect URL",
          message: "Error$e",
          duration:const Duration(seconds: 3),
        ).show(context);
      }
    } else {
      Flushbar(
        title: "Empty Fields",
        message: "Email and Password is required",
        duration:const Duration(seconds: 3),
      ).show(context);
    }
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        errors.remove(error);
      });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    return internet
        ? Form(
            key: _formKey,
            child: Column(
              children: [
                buildEmailFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildPasswordFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Row(
                  children: [
                    Checkbox(
                      value: remember,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          remember = value!;
                        });
                      },
                    ),
                    const Text("Remember me"),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, ForgotPasswordScreen.routeName),
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                FormError(errors: errors),
                SizedBox(height: getProportionateScreenHeight(20)),
                SizedBox(
                  width: MySize.safeWidth,
                  height: MySize.size60,
                  child: ElevatedButton(
                      onPressed: () {
                        isLoading = true;
                        loginUser();
                      },
                      child: !isLoading
                          ? Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: MySize.size22,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(color: Colors.white),
                                SizedBox(width: MySize.size20),
                                Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontSize: MySize.size22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )),
                ),
                // DefaultButton(
                //   text: "Login",
                //   press: () {
                //     if (_formKey.currentState!.validate()) {
                //       _formKey.currentState!.save();
                //       // if all are valid then go to success screen
                //       KeyboardUtil.hideKeyboard(context);
                //       Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                //     }
                //   },
                // ),
              ],
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "No Internet Connection",
                  style: AppTheme.getTextStyle(
                    themeData!.textTheme.headline5,
                    fontWeight: 700,
                    color: themeData!.colorScheme.primary,
                  ),
                ),
                Image.asset(
                  "assets/images/no_internet_connection.jpg",
                ),
                SizedBox(height: MySize.size20),
                ElevatedButton.icon(
                  onPressed: () {
                    internet = true;
                    setState(() {});
                  },
                  icon: const Icon(Icons.history),
                  label: const Text("Reload"),
                )
              ],
            ),
          );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return ;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: MySize.size20),

        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();

  TextFormField buildEmailFormField() {
    return TextFormField(
      scrollPadding: EdgeInsets.zero,

      controller: usernameController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return ;
      },
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     addError(error: kEmailNullError);
      //     return "";
      //   } else if (!emailValidatorRegExp.hasMatch(value)) {
      //     addError(error: kInvalidEmailError);
      //     return "";
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: 0, horizontal: MySize.size20),
        // contentPadding: EdgeInsets.symmetric(horizontal: MySize.size20),
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
