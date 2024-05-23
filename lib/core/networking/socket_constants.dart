class WebSocketConstants {
  // Protocols
  static const wsProtocol = "ws://";

  static const String domain = "pharmalink.tech/";
  static const String wsDomain = "$wsProtocol$domain";

  static const String tokenKey = "patientCustomToken";

  // ===================== Chat Sockets =====================
  static const chatChannel = "ws/chat/user/{user_id}/";
  static const allChatsChannel = "websocket/chat_info/user";
}

class SocketEvents {
  static const String connect = "connect";
  static const String connectError = "connect_error";
  static const String connectTimeout = "connect_timeout";
  static const String connecting = "connecting";
  static const String disconnect = "disconnect";
  static const String error = "error";
  static const String reconnect = "reconnect";
  static const String reconnectAttempt = "reconnect_attempt";
  static const String reconnectFailed = "reconnect_failed";
  static const String reconnectError = "reconnect_error";
  static const String reconnecting = "reconnecting";
  static const String ping = "ping";
  static const String pong = "pong";
}
