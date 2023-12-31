import 'dart:core';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../shipping_payment/Services.dart';
import '../shipping_payment/receipt.dart';

class Payment extends StatefulWidget {
  final Function onFinish;
  final transactionParams;
  final receiptData;

  const Payment(
      {Key? key,
      required this.onFinish,
      this.transactionParams,
      this.receiptData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PaymentState();
  }
}

class PaymentState extends State<Payment> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? checkoutUrl;
  String? executeUrl;
  String? accessToken;
  Services services = Services();

  // you can change default currency according to your need
  Map<dynamic, dynamic> defaultCurrency = {
    "symbol": "USD ",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "USD"
  };

  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL = 'cancel.example.com';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      try {
        accessToken = (await services.getAccessToken())!;

        // final transactions = getOrderParams();
        final res = await services.createPaypalPayment(
            widget.transactionParams, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"]!;
            executeUrl = res["executeUrl"]!;
          });
        }
      } catch (e) {
        print('exception: ' + e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(checkoutUrl);

    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: WebView(
          initialUrl: checkoutUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains(returnURL)) {
              final uri = Uri.parse(request.url);
              final payerID = uri.queryParameters['PayerID'];
              if (payerID != null) {
                services
                    .executePayment(executeUrl, payerID, accessToken, context)
                    .then(
                  (id) {
                    widget.receiptData['createdTime'] = id!['create_time'];
                    widget.receiptData['createdTime'] = id!['create_time'];
                    // Navigator.pop(context, id);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetReceipt(
                          receiptData: widget.receiptData,
                        ),
                      ),
                    );
                    return id;

                    // getReceipt();
                  },
                );
              } else {
                Navigator.of(context).pop();
              }
              // Navigator.of(context).pop();
            }
            if (request.url.contains(cancelURL)) {
              // Navigator.of(context).pop();
            }
            // return null;
            return NavigationDecision.navigate;
          },
        ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: CircularProgressIndicator())),
      );
    }
  }
}
