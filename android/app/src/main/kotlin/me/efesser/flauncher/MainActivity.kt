package me.efesser.flauncher

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.Intent.CATEGORY_LEANBACK_LAUNCHER
import android.content.IntentFilter
import android.content.pm.ResolveInfo
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.Drawable
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream


private const val METHOD_CHANNEL = "me.efesser.flauncher/method"
private const val EVENT_CHANNEL = "me.efesser.flauncher/event"

class MainActivity : FlutterActivity() {
    val broadcastReceivers = ArrayList<BroadcastReceiver>()

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getInstalledApplications" -> {
                    result.success(getInstalledApplications())
                }
                "launchApp" -> {
                    (call.arguments as List<String>).let {
                        result.success(launchApp(it[0], it[1]))
                    }
                }
                "openSettings" -> {
                    result.success(openSettings())
                }
                else -> throw IllegalArgumentException()
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL).setStreamHandler(object : StreamHandler {
            lateinit var broadcastReceiver: SinkBroadcastReceiver
            override fun onListen(o: Any?, eventSink: EventSink) {
                broadcastReceiver = SinkBroadcastReceiver(eventSink)
                val intentFilter = IntentFilter()
                intentFilter.addAction(Intent.ACTION_PACKAGE_ADDED)
                intentFilter.addAction(Intent.ACTION_PACKAGE_REMOVED)
                intentFilter.addAction(Intent.ACTION_PACKAGE_REPLACED)
                intentFilter.addDataScheme("package")
                broadcastReceivers.add(broadcastReceiver)
                registerReceiver(broadcastReceiver, intentFilter)
            }

            override fun onCancel(o: Any?) {
                unregisterReceiver(broadcastReceiver)
                broadcastReceivers.remove(broadcastReceiver)
            }
        })
    }

    override fun onDestroy() {
        broadcastReceivers.forEach(::unregisterReceiver)
        super.onDestroy()
    }

    private fun getInstalledApplications() = packageManager
            .queryIntentActivities(Intent(Intent.ACTION_MAIN, null).addCategory(CATEGORY_LEANBACK_LAUNCHER), 0)
            .map(ResolveInfo::activityInfo)
            .map {
                mapOf(
                        "name" to it.loadLabel(packageManager),
                        "packageName" to it.packageName,
                        "banner" to it.loadBanner(packageManager)?.let(::drawableToByteArray),
                        "icon" to it.loadIcon(packageManager)?.let(::drawableToByteArray),
                        "className" to it.name
                )
            }
            .sortedWith(compareBy(String.CASE_INSENSITIVE_ORDER) { it["name"] as String })

    private fun drawableToBitmap(drawable: Drawable): Bitmap {
        val bitmap = Bitmap.createBitmap(drawable.intrinsicWidth, drawable.intrinsicHeight, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)
        drawable.setBounds(0, 0, canvas.width, canvas.height)
        drawable.draw(canvas)
        return bitmap
    }

    private fun drawableToByteArray(drawable: Drawable): ByteArray {
        val bitmap = drawableToBitmap(drawable)
        val stream = ByteArrayOutputStream()
        bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
        return stream.toByteArray()
    }

    private fun launchApp(packageName: String, className: String) = try {
        Intent(Intent.ACTION_MAIN)
                .setFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                .setClassName(packageName, className)
                .let(::startActivity)
        true
    } catch (e: Exception) {
        false
    }

    private fun openSettings() = try {
        startActivity(Intent(Settings.ACTION_SETTINGS))
        true
    } catch (e: Exception) {
        false
    }
}

class SinkBroadcastReceiver(private val sink: EventSink) : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        sink.success(mapOf(
                "action" to intent.action,
                "packageName" to intent.data.toString()
        ))
    }
}
