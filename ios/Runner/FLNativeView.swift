//
//  FLNativeView.swift
//  Runner
//
//  Created by SY L on 2023/09/24.
//

import Foundation

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView
    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger?){
        _view = UIView()
        super.init()
        createNativeView(view: _view)
    }
    
    func view() -> UIView {
        return _view
    }
    
    func createNativeView(view _view: UIView){
        _view.backgroundColor = UIColor.blue
        let nativeLabel = UILabel()
        nativeLabel.text = "Native text from iOS"
        nativeLabel.textColor = UIColor.white
        nativeLabel.textAlignment = .center
        nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)
        _view.addSubview(nativeLabel)
    }
}
