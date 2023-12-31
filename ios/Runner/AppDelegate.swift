import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      let sampleChannel = FlutterMethodChannel(name: "samples.flutter.lsytodo", binaryMessenger: controller.binaryMessenger)
      sampleChannel.setMethodCallHandler({ [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

          switch call.method {
          case "channelTest":
              result("hihi im ios")
          case "channelTestArg":
              guard let args = call.arguments as? Dictionary<String, Any> else {return}
              let arg1 = args["arg1"] ?? ""
              result("\(arg1) haha")
          default:
              result(FlutterMethodNotImplemented)
          }

      })
      weak var registrar = self.registrar(forPlugin: "plugin-name")
      let factory = FLNativeViewFactory(messenger: registrar!.messenger())
      self.registrar(forPlugin: "<plugin-name>")!.register(
          factory,
          withId: "<platform-view-type>")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

//class FLPlugin: NSObject, FlutterPlugin {
//    public static func register(with registrar: FlutterPluginRegistrar) {
//        let factory = FLNativeViewFactory(messenger: registrar.messenger())
//        registrar.register(factory, withId: "<platform-view-type>")
//    }
//}
