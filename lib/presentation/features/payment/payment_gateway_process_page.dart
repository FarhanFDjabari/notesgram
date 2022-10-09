import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesgram/presentation/features/payment/controller/payment_topup_controller.dart';
import 'package:notesgram/presentation/widgets/text/text_nunito.dart';
import 'package:notesgram/theme/resources.dart';
import 'package:notesgram/utils/helpers/constant.dart';
import 'package:remixicon/remixicon.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentGatewayProcessPage extends StatefulWidget {
  const PaymentGatewayProcessPage({
    required this.initialUrl,
    Key? key,
  }) : super(key: key);

  final String initialUrl;

  @override
  State<PaymentGatewayProcessPage> createState() =>
      _PaymentGatewayProcessPageState();
}

class _PaymentGatewayProcessPageState extends State<PaymentGatewayProcessPage> {
  late String initialUrl;
  late WebViewController _webViewController;

  @override
  void initState() {
    initialUrl = widget.initialUrl;
    super.initState();

    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    } else if (Platform.isIOS) {
      WebView.platform = CupertinoWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.neutral100,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Resources.color.gradient600to800,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextNunito(
          text: 'Top Up',
          size: 15.sp,
          fontWeight: Weightenum.BOLD,
          color: Resources.color.neutral50,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Remix.arrow_left_s_line,
            color: Resources.color.neutral50,
          ),
          iconSize: 28,
        ),
      ),
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onWebViewCreated: (webviewController) {
          _webViewController = webviewController;
        },
        onPageFinished: (result) {
          debugPrint(result);
          Get.find<PaymentTopupController>().getNewUserData();
        },
        javascriptChannels: {
          JavascriptChannel(
            name: 'messageHandler',
            onMessageReceived: (message) async {
              debugPrint(message.message);
            },
          ),
        },
      ),
    );
  }
}
