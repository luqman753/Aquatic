import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stable_aquatic/AppTheme.dart';

import '../../components/custom_widgets/skeleton_container.dart';
import '../../models/SharedPref.dart';
import '../../size_config.dart';
import 'components/add_address.dart';


class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> with TickerProviderStateMixin {
  static const List<IconData> icons =  [
    MdiIcons.plus,
    MdiIcons.plus,
  ];
  bool internet = true;
  static const List<String> iconsText =  [
    "Add Address",
    "Add My Address",
  ];
  AnimationController? _controller;

  late Future futureAddres;
  late ThemeData themeData;
  getAddresses() async {
    try {
      String? token = await getToken();

      String link = "${getCloudUrl()}/api/AddressBook";
      var url = Uri.parse(link);
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      // print(response.statusCode);
      // print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return data;
      } else {
        // print("Exception");
        throw Error;
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      internet = false;
      // print('Socket Error: $e');
      setState(() {});
    } on Error catch (e) {
      // print('General Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();

    _controller =  AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    futureAddres = getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    themeData = themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          internet
              ? FutureBuilder(
                  future: futureAddres,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: (snapshot.data as List).length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                      MySize.size10,
                                      MySize.size2,
                                      MySize.size10,
                                      MySize.size2,
                                    ),
                                    child: Card(
                                      elevation: 15,
                                      clipBehavior: Clip.antiAlias,
                                      // shape: RoundedRectangleBorder(
                                      //   borderRadius:  BorderRadius.circular(
                                      //     MySize.size20,
                                      //   ),
                                      // ),
                                      child: ListTileTheme(
                                        // dense: true,

                                        contentPadding: EdgeInsets.fromLTRB(
                                            MySize.size10, 0, 0, 0),
                                        child: ExpansionTile(
                                          // leading: CircleAvatar(),
                                          trailing:const  SizedBox.shrink(),
                                          title: Text(
                                            (snapshot.data as List)[index]
                                                    ["lastName"]
                                                .toString(),
                                            style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              // fontSize: Mysize,
                                              fontWeight: 600,
                                            ),
                                          ),
                                          subtitle: Text(
                                            (snapshot.data as List)[index]
                                                        ["address"]
                                                    .toString() +
                                                ", " +
                                                (snapshot.data as List)[index]
                                                        ["city"]
                                                    .toString() +
                                                ", " +
                                                (snapshot.data as List)[index]
                                                        ["state"]
                                                    .toString() +
                                                ", " +
                                                (snapshot.data as List)[index]
                                                        ["zipCode"]
                                                    .toString(),
                                            style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText1,
                                              // fontSize: Mysize,
                                              fontWeight: 500,
                                            ),
                                          ),
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 15.0,
                                                right: 15.0,
                                                bottom: 5,
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "City: ",
                                                        style: AppTheme
                                                            .getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText1,
                                                          // fontSize: Mysize,
                                                          fontWeight: 500,
                                                        ),
                                                      ),
                                                      Text(
                                                        (snapshot.data
                                                                    as List)[
                                                                index]["city"]
                                                            .toString(),
                                                        style: AppTheme
                                                            .getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText1,
                                                          // fontSize: Mysize,
                                                          fontWeight: 500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Organization: ",
                                                        style: AppTheme
                                                            .getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText1,
                                                          // fontSize: Mysize,
                                                          fontWeight: 500,
                                                        ),
                                                      ),
                                                      Text(
                                                        (snapshot.data as List)[
                                                                    index][
                                                                "organization"]
                                                            .toString(),
                                                        style: AppTheme
                                                            .getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText1,
                                                          // fontSize: Mysize,
                                                          fontWeight: 500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Email: ",
                                                        style: AppTheme
                                                            .getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText1,
                                                          // fontSize: Mysize,
                                                          fontWeight: 500,
                                                        ),
                                                      ),
                                                      Text(
                                                        (snapshot.data
                                                                    as List)[
                                                                index]["email"]
                                                            .toString(),
                                                        style: AppTheme
                                                            .getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText1,
                                                          // fontSize: Mysize,
                                                          fontWeight: 500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Phone No: ",
                                                        style: AppTheme
                                                            .getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText1,
                                                          // fontSize: Mysize,
                                                          fontWeight: 500,
                                                        ),
                                                      ),
                                                      Text(
                                                        (snapshot.data as List)[
                                                                    index][
                                                                "phoneNumber"]
                                                            .toString(),
                                                        style: AppTheme
                                                            .getTextStyle(
                                                          themeData.textTheme
                                                              .bodyText1,
                                                          // fontSize: Mysize,
                                                          fontWeight: 500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Image.asset(
                            "assets/images/no_data_found.jpg",
                          ),
                        );
                      }
                    } else {
                      return listViewWithoutLeadingPictureWithExpandedSkeleton(
                          context);
                    }
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: MySize.size50),
                      Text(
                        "No Internet Connection",
                        style: AppTheme.getTextStyle(
                          themeData.textTheme.headline5,
                          fontWeight: 700,
                          color: themeData.colorScheme.primary,
                        ),
                      ),
                      Image.asset(
                        "assets/images/no_internet_connection.jpg",
                      ),
                      SizedBox(height: MySize.size50),
                      ElevatedButton.icon(
                        onPressed: () {
                          internet = true;
                          setState(() {});
                          futureAddres = getAddresses();
                        },
                        icon: const Icon(Icons.history),
                        label: const Text("Reload"),
                      )
                    ],
                  ),
                )
        ],
      ),
      floatingActionButton:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:  List.generate(icons.length, (int index) {
          Widget child =  SizedBox(
            height: 70.0,
            width: MediaQuery.of(context).size.width,
            child:  ScaleTransition(
              scale:  CurvedAnimation(
                parent: _controller!,
                curve:  Interval(0.0, 1.0 - index / icons.length / 2.0,
                    curve: Curves.easeOutQuint),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        left: MySize.size8,
                        right: MySize.size8,
                        top: MySize.size4,
                        bottom: MySize.size4),
                    margin: const EdgeInsets.only(right: 4),
                    color: themeData.primaryColor,
                    child: Text(iconsText[index],
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2)),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: themeData.primaryColor,
                    mini: true,
                    child:  Icon(icons[index],
                        color: themeData.colorScheme.onSecondary),
                    onPressed: () {
                      index == 0
                          ? Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return const AddAddress(
                                myAddress: false,
                              );
                            }))
                          : Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return const AddAddress(
                                myAddress: true,
                              );
                            }));
                      // showSimpleSnackbar();
                    },
                  ),
                ],
              ),
            ),
          );
          return child;
        }).toList()
          ..add(
             FloatingActionButton(
              heroTag: null,
              backgroundColor: themeData.primaryColor,
              child:  AnimatedBuilder(
                animation: _controller!,
                builder: (BuildContext? context, Widget? child) {
                  return  Transform(
                    transform:
                         Matrix4.rotationZ(_controller!.value * 0.5 * pi),
                    alignment: FractionalOffset.center,
                    child:  Icon(
                      _controller!.isDismissed ? Icons.add : Icons.close,
                      color: themeData.colorScheme.onPrimary,
                    ),
                  );
                },
              ),
              onPressed: () {
                if (_controller!.isDismissed) {
                  setState(() {});
                  _controller!.forward();
                } else {
                  setState(() {});
                  _controller!.reverse();
                }
              },
            ),
          ),
      ),

      // FloatingActionButton(
      //   backgroundColor: Colors.green,
      //   child: Icon(MdiIcons.plus),
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) {
      //       return AddAddress();
      //     }));
      //   },
      // ),
    );
  }
}
