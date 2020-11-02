import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OrderPaymentWebViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebViewStateWidget();
  }
}

class WebViewStateWidget extends State<OrderPaymentWebViewWidget> {
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text(
          "H5",
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 16.0,
          ),
        ),
      ),
      body: _buildWebView(),
    );
  }

  Widget _buildWebView() {
    return Container(
      child: WebView(initialUrl: 'https://flutter.cn',),
    );
  }

}
