package com.rolox.money

import android.util.Log
import android.widget.Toast
import com.zl.nimbblpaycoresdk.interfaces.NimbblCheckoutPaymentListener
import com.zl.nimbblpaycoresdk.interfaces.NimbblInItResourceListener
import com.zl.nimbblpaycoresdk.models.NimbblCheckoutOptions
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import tech.nimbbl.checkout.sdk.NimbblCheckoutSDK


class MainActivity : FlutterActivity(), NimbblCheckoutPaymentListener, NimbblInItResourceListener {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "payment_nimbbl_method_channel")
                .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                    Log.e("token from flutter", call.arguments.toString())
                    if (call.method == "payment_nimbbl_initiating") {
                        val data = call.arguments as Map<String, String>
                        Log.e("token from flutter", data["token"]!!)
                        Log.e("order from flutter", data["orderId"]!!)
                        NimbblCheckoutSDK.instance?.init(this)
                        NimbblCheckoutSDK.instance?.checkout(NimbblCheckoutOptions.Builder()
                                .setPackageName("com.rolox.money.dev").setToken(data["token"])
                                .setOrderId(data["orderId"]).build())
                    } else {
                        result.notImplemented()
                    }
                }
    }

    override fun onPaymentFailed(data: String) {
        Toast.makeText(this, "onPaymentFailed due to: $data", Toast.LENGTH_LONG).show()
        Log.e("onPaymentFailed:", data)
    }

    override fun onPaymentSuccess(data: MutableMap<String, Any>) {
        Toast.makeText(this, "onPaymentSuccess $data", Toast.LENGTH_LONG).show()
        Log.e("onPaymentSuccess:", data.toString())

    }

    override fun onResourceLoaded(isLoaded: Boolean, message: String) {
        Log.e("onResourceLoaded:", message)
        Toast.makeText(this, "onResourceLoaded $message   is loaded--> $isLoaded", Toast.LENGTH_LONG).show()
    }
}
