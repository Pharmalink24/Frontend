import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/api/api_service.dart';
import 'package:pharmalink/core/networking/socket/socket_service.dart';
import '../../../../../core/helpers/shared_preferences/auth_prefs.dart';
import '../../../../../core/networking/api/api_error_handler.dart';
import '../../../../../core/networking/api/api_result.dart';
import '../models/chats_response.dart';
import '../models/message.dart';
import '../models/messages_history_response.dart';

enum ChannelType { allChats, chatting, allMessages }

class ChatRepo {
  final ApiService _apiService;
  final SocketService _socketService;
  ChatRepo(this._socketService, this._apiService);

  // ------------------------ Chat Channels ------------------------ //
  void retrieveUserChats(Function(ChatsResponse chats) onListen) async {
    // Get the access token
    final String accessToken = await AuthSharedPrefs.getAccessToken();

    // Connect to the user chats channel
    _socketService.connectToUserChatsChannel(accessToken);

    // Listen to the user chats channel
    _socketService.listenToUserChats((event) {
      final ChatsResponse chats = ChatsResponse.fromJson(jsonDecode(event));
      onListen(chats);
    });

    // // Close the user chats channel
    // _socketService.closeUserChatsChannel();
  }

  // ------------------------ Messaging Channels ------------------------ //
  void messaging(Function(Message message) onListen) async {
    // Get the access token
    final String accessToken = await AuthSharedPrefs.getAccessToken();

    // Connect to the chatting channel
    _socketService.connectToMessagingChannel(
      AuthSharedPrefs.getUserId(),
      accessToken,
    );

    // Listen to the chatting channel
    _socketService.listenToMessagingChannel(
      (event) {
        final Message message = Message.fromJson(jsonDecode(event));
        onListen(message);
      },
    );
  }

  // Send the message
  void sendMessageToMessagingChannel(int receiverId, String message) {
    _socketService.sendMessageToMessagingChannel(
      Message(
        message: message,
        senderUserId: AuthSharedPrefs.getUserId(),
        receiverDoctorId: receiverId,
      ),
    );
  }

  // ------------------------ All Messages Channels ------------------------ //
  Future<ApiResult<MessagesHistoryResponse>> retrieveAllMessages(
    int receiverId, {
    int pageSize = 10,
    int pageNumber = 1,
  }) async {
    try {
      final result = await _apiService.getMessagesHistory(
        AuthSharedPrefs.getUserId(),
        receiverId,
        pageNumber,
        pageSize,
      );

      return ApiResult.success(result);
    } catch (error) {
      Logger().e('Error in retrieving all messages: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  //-------------------- Streams --------------------//

  // Retrieve the chatting stream
  Stream<dynamic>? getChattingStream() {
    return _socketService.getChattingStream();
  }

  Stream<dynamic>? getUserChatsStream() {
    return _socketService.getUserChatsStream();
  }
}
