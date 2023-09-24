//
//  FLNativeViewFactory.swift
//  Runner
//
//  Created by SY L on 2023/09/24.
//

import Foundation
class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    init(messenger: FlutterBinaryMessenger){
        self.messenger = messenger
        super.init()
    }
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return FLNativeView(frame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
