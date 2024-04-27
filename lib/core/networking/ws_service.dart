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

  // ==================== Send Message ==================== //
  Future<Stream<dynamic>> sendMessage(Message message, String auth) async {
    // Connect to the server
    final headers = {
      'Authorization': auth,
    };
    ws.connect(ApiConstants.sendMessage, headers);

    // Convert the message object to a JSON string
    final payload = jsonEncode(message.toJson());
    Logger().i(payload);
    ws.send(payload);
    
    return ws.receive();
  }

  // ==================== Retrieve Messages ==================== //
  // Todo: Edit the retrieveMessages arguments
  void retrieveMessages(Message message, String auth) async {
    // Connect to the server
    final headers = {
      'Authorization': auth,
    };
    ws.connect(ApiConstants.retrieveMessages, headers);

    // Convert the message object to a JSON string
    final payload = jsonEncode(message.toJson());
    ws.send(payload);
  }
}
