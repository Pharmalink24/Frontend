import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/networking/ws_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';

import '../models/message.dart';

class ChatRepo {
  final WsService _wsService;
  final ApiService _apiService;

  const ChatRepo(this._wsService, this._apiService);

  Future<void> sendMessage(Message message) async {
    try {
      _wsService.sendMessage(
        message,
        AuthSharedPrefs.getAccessToken() ?? '',
      );
    } catch (error) {
      Logger().e(error);
    }
  }
}
