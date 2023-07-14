import 'dart:async';
import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';

// import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stable_aquatic/user/profile/components/upcharges%20Service/List.dart';

import '../../../../Service/Service.dart';
import '../../../../components/custom_widgets/skeleton_container.dart';
import '../../../../models/SharedPref.dart';


class Announcements extends StatefulWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  Future? futureUserList;
  StreamSubscription? sub;
  Service services = new Service();
  bool isConnected = false;
  late ThemeData themeData;

  var listData;
getUsersAnnouncements() async {
    // quickQuote = 0;
    // curl();
    String? token = await getToken();

    String link =
        "${getCloudUrl()}/api/Auth/GetAnnoucement";
    // "${getCloudUrl()}​/api​/ShipmentOrder​/getfedexorderlist";

    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
       var data = json.decode(response.body);
       listData.add(data["data"]);
      return listData;
    } else {
      print("Exception");
      throw Error;
    }
  }


  @override
  void initState() {
    super.initState();
    futureUserList = getUsersAnnouncements();
    // sub = Connectivity().onConnectivityChanged.listen((result) {
    //   setState(() {
    //     isConnected = (result != ConnectivityResult.none);

    //     if (isConnected == false) {
    //       Flushbar(
    //         title: "Internet",
    //         message: "Offline",
    //         duration: Duration(seconds: 3),
    //       )..show(context);
    //     }
    //   });
    // });
  }

  void dispose() {
    sub!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Service Upcharge"),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: futureUserList,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return listData.length!= 0
                ? UpchargeService(data: snapshot.data)
                : Center(
                    child: Image.asset(
                    "assets/images/no_data_found.jpg",
                  )
                    // Image.asset(

                    );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Center(
                  child: Image.asset(
                "assets/images/no_data_found.jpg",
              )),
            );
          }
        } else {
          return listViewWithoutLeadingPictureWithoutExpandedSkeleton(context);
        }
      },
    )
            ),
          ],
        ));
  }
}
