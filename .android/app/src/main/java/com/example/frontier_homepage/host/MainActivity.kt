import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {


    private val eventChannelName = "platform_channel_events/test"
    private var eventSink: EventChannel.EventSink? = null
    private lateinit var eventHandler: EventHandler


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        eventHandler=EventHandler(this)
        val eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, eventChannelName)
        eventChannel.setStreamHandler(eventHandler)


    }
}