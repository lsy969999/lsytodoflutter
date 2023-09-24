import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:lsy_todo/flavors.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  static const platform = MethodChannel('samples.flutter.lsytodo');
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webViewKey,
      initialUrlRequest: URLRequest(url: WebUri(F.webUrl)),
      onWebViewCreated: (controller) {
        controller.addJavaScriptHandler(
            handlerName: 'handlerName1',
            callback: (args) async {
              var result = await platform.invokeMethod('channelTest');
              print(result);
              return {result: result};
            });
        controller.addJavaScriptHandler(
            handlerName: 'handlerName2',
            callback: (args) {
              print(args);
              return "hi";
            });
        controller.addJavaScriptHandler(
            handlerName: 'handlerName3',
            callback: (args) async {
              var a = args[0];
              var result = await platform
                  .invokeMethod('channelTestArg', {"arg1": "$a arg1!!!"});
              print(args);
              print(result);
              return result;
            });
        controller.addJavaScriptHandler(
            handlerName: 'appInfo',
            callback: (args) async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();

              String appName = packageInfo.appName;
              String packageName = packageInfo.packageName;
              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;
              return {
                'appName': appName,
                'packageName': packageName,
                'version': version,
                'buildNumber': buildNumber,
              };
            });
        controller.getSettings().then((value) {
          // print('useragent: ${value?.userAgent}');
          controller.setSettings(
              settings: InAppWebViewSettings(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
            allowsInlineMediaPlayback: true,
            iframeAllowFullscreen: true,
            isInspectable: true,
            javaScriptEnabled: true,
          ));
          webViewController = controller;
        });
        controller.getUrl().then((value) async {
          // print("getUrl: ${value}");
          if (value == null) {
            return;
          }

          // get the CookieManager instance
          CookieManager cookieManager = CookieManager.instance();

          // set the expiration date for the cookie in milliseconds
          // final expiresDate =
          //     DateTime.now().add(Duration(days: 3)).millisecondsSinceEpoch;
          await cookieManager.setCookie(
            url: value,
            name: "myCookie",
            value: "myValue",
          );
        });
      },
      shouldOverrideUrlLoading: (controller, navigationAction) async {
        return NavigationActionPolicy.ALLOW;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
