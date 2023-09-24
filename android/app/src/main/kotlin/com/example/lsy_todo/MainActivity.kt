package com.example.lsy_todo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.lsytodo"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler{call, result ->
            when (call.method){
                "channelTest" ->{
                    result.success("hihi im anroid")
                }
                "channelTestArg" -> {
                    val arg1 = call.argument<String>("arg1")
                    result.success(arg1 + "haha")
                }
                else -> result.notImplemented()
            }

        }
    }
}
