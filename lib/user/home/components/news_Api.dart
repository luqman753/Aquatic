import 'dart:convert';


import 'package:http/http.dart';

import '../../../models/SharedPref.dart';
import 'model.dart';

class NewsApi {
  Client client = Client();
  Future fetchAlbum() async {
    final response = await client.get(
      Uri.parse(
          '${getCloudUrl()}/api/ShipmentOrder/totalavgcost'),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjMyZTJmYTZmLTdlNTEtNGQ4ZC1iNTQ3LTA3YzE5ZGRmYWZiOCIsInJvbGUiOiJVc2VyIiwibmJmIjoxNjM1NzUwMTI3LCJleHAiOjE2MzYzNTQ5MjcsImlhdCI6MTYzNTc1MDEyN30.MvLCoKoS_opJ4TQbzYPQTSjan4rh4WVUdb1Ia2IBtSY",
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var orders;
  Future avgCost() async {
    String? token = await getToken();

    var url = Uri.parse(
        "${getCloudUrl()}/api/ShipmentOrder/totalavgcost");
    var response = await client.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      orders = json.decode(response.body);
      return orders;
    } else {
      // print("Exception");
      throw Error;
    }
  }
}
