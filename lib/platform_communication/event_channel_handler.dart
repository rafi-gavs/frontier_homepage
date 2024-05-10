import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class EventChannelHandler {
  final _eventChannel = const EventChannel("platform_channel_events/test");

  void listen() {
    var stream = _eventChannel.receiveBroadcastStream();
    stream.listen((event) {
      debugPrint('event : $event');
    });
  }
}
