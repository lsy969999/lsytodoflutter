import 'package:flutter/material.dart';
import 'package:lsy_todo/pages/webview/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(F.title),
      // ),
      body: Center(
          child: SafeArea(
        child: WebViewWidget(controller: controller),
      )),
    );
  }
}
