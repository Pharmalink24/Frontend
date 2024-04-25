import 'package:logger/logger.dart';
import 'package:web_socket_channel/io.dart';

import 'api_constants.dart';

class WsFactory {
  static final WsFactory _webSocketService = WsFactory._internal();

  factory WsFactory() {
    return _webSocketService;
  }
  WsFactory._internal();

  // Base url for the websocket connection
  final String baseUrl = "${ApiConstants.wsProtocol}${ApiConstants.baseUrl}";

  // Websocket channel
  IOWebSocketChannel? channel;

  // Time out duration for the websocket connection
  Duration timeOut = const Duration(seconds: 60);

  // Initialize the websocket connection
  void connect(String url, Map<String, String> headers) {
    // Initiate the websocket connection
    channel = IOWebSocketChannel.connect(Uri.parse('$baseUrl$url'),
        headers: headers, connectTimeout: timeOut);

    // If channel is not null
    if (channel != null) {
      // Listen to the stream and call the event listener
      channel!.stream.listen(
        (event) {},
        onDone: () {
          Logger().i('Websocket connection closed');
        },
        onError: (error) {
          Logger().e('Websocket connection error: $error');
        },
      );
    }
  }

  void send(dynamic data) {
    if (channel != null) {
      channel!.sink.add(data);
    }
  }

  void disconnect() {
    if (channel != null) {
      channel!.sink.close();
    }
  }
}
