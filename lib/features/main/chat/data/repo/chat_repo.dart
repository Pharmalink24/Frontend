import 'package:logger/logger.dart';
import 'package:pharmalink/core/models/timestamp.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/networking/ws_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';

import '../models/message.dart';

class ChatRepo {
  final WsService _wsService;
  final ApiService _apiService;

  const ChatRepo(this._wsService, this._apiService);

  Future<Stream<dynamic>?> connectChat() async {
    try {
      var messagesStream = await _wsService.connectChat(
        AuthSharedPrefs.getAccessToken() ?? '',
      );

      return messagesStream;
    } catch (error) {
      Logger().e(error);
      return null;
    }
  }

  Future<void> sendMessage(
      {required int doctorId, required String message}) async {
    try {
      await _wsService.sendChat(
        Message(
          senderUserId: AuthSharedPrefs.getUserId()!,
          receiverDoctorId: doctorId,
          message: message,
        ),
      );
    } catch (error) {
      Logger().e(error);
    }
  }

  Future<Stream<dynamic>?> retrieveMessages(int doctorId) async {
    try {
      final messagesListStream = await _wsService.connectRetrieveMessages(
        AuthSharedPrefs.getAccessToken() ?? '',
      );
      
      return messagesListStream;
    } catch (error) {
      Logger().e(error);
      return null;
    }
  }
}
