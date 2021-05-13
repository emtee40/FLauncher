package me.efesser.flauncher

import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import android.os.Build.VERSION.SDK_INT
import android.os.Build.VERSION_CODES.N_MR1
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity() {
    private val CHANNEL = "me.efesser.flauncher/package_manager"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getInstalledApplications") {
                result.success(getInstalledApplications())
            }
            if (call.method == "startActivity") {
                result.success(startActivity(call.arguments as String))
            }
        }
    }

    private fun getInstalledApplications(): List<Map<String, Any?>> {
        val installedApplications = packageManager.getInstalledApplications(0)
        return installedApplications
                .filter { packageManager.getLaunchIntentForPackage(it.packageName) != null }
                .map {
                    mapOf(
                            "name" to it.loadLabel(packageManager),
                            "packageName" to it.packageName,
                            "banner" to if (it.banner != 0) drawableToByteArray(it.loadBanner(packageManager)) else null,
                            "icon" to if (it.icon != 0) drawableToByteArray(it.loadIcon(packageManager)) else null
                    )
                }
    }

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

    private fun startActivity(packageName: String) = try {
        startActivity(packageManager.getLaunchIntentForPackage(packageName))
        true
    } catch (e: Exception) {
        false
    }
}
