import 'package:flutter/material.dart';
import 'package:lsy_todo/pages/platformview/playformview.dart';
import 'package:lsy_todo/pages/webview/webview.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(F.title),
        // ),
        body: Center(
      child: SafeArea(
          child: Column(
        children: [Expanded(child: MyWebView()), Expanded(child: MyWidget())],
      )),
    ));
  }
}
