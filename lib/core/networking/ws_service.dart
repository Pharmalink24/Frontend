import 'package:logger/logger.dart';
import '../../features/main/chat/data/models/message.dart';
import 'dart:convert';
import 'api_constants.dart';
import 'ws_factory.dart';

class WsService {
  WsService(
    this.ws,
  );
  final WsFactory ws;

  // ==================== Connect to Retrieve Messages ==================== //
  Future<dynamic> connectRetrieveMessages(String auth) async {
    // Connect to the server
    final headers = {
      'Authorization': auth,
    };

    final stream = ws.connect(ApiConstants.retrieveMessages, headers);

    return stream;
  }

  // ==================== Connect to Chat ==================== //
  Future<Stream<dynamic>?> connectChat(String auth) async {
    // Connect to the server
    final headers = {
      'Authorization': auth,
    };
    final stream = ws.connect(ApiConstants.sendMessage, headers);

    return stream;
  }

  // ==================== Send Message ==================== //
  Future<void> sendChat(Message message) async {
    // Convert the message object to a JSON string
    final payload = jsonEncode(message.toJson());
    Logger().i(payload);
    ws.send(payload);
  }
}
