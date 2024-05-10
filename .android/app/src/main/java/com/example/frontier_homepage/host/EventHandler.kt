import android.app.Activity
import io.flutter.plugin.common.EventChannel

class EventHandler(private var activity: Activity?) : EventChannel.StreamHandler{

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        TODO("Not yet implemented")
        activity?.runOnUiThread { events?.success(arguments) }
    }

    override fun onCancel(arguments: Any?) {
        TODO("Not yet implemented")
    }

}