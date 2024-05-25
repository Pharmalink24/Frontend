import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/networking/socket_channel.dart';
import 'package:pharmalink/core/networking/socket_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import '../models/chat.dart';
import '../models/chats_response.dart';
import '../models/message.dart';

enum ChannelType { allChats, chatting, allMessages }

class ChatRepo {
  final ApiService _apiService;
  final SocketService _socketService;
  ChatRepo(this._socketService, this._apiService);

  // ------------------------ Chat Channels ------------------------ //
  SocketChannel retrieveUserChats() {
    // Get the access token
    final String accessToken = AuthSharedPrefs.getAccessToken() ?? '';

    // Connect to the user chats channel
    return _socketService.connectToUserChatsChannel(accessToken);

    // Listen to the user chats channel
    // _socketService.listenToUserChats((event) {
    //   final ChatsResponse chats = ChatsResponse.fromJson(jsonDecode(event));
    // });

    // Close the user chats channel
    // _socketService.closeUserChatsChannel();
  }

  // ------------------------ Messaging Channels ------------------------ //
  void messaging(Function(Message message) onListen) {
    // Get the access token
    final String accessToken = AuthSharedPrefs.getAccessToken() ?? '';

    // Connect to the chatting channel
    _socketService.connectToMessagingChannel(
        AuthSharedPrefs.getUserId() ?? -1, accessToken);

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
        senderUserId: AuthSharedPrefs.getUserId() ?? -1,
        receiverDoctorId: receiverId,
      ),
    );
  }

  // ------------------------ All Messages Channels ------------------------ //
  void retrieveAllMessages(
      int receiverId, Function(List<Message> messages) onListen) {
    // Get the access token
    final String accessToken = AuthSharedPrefs.getAccessToken() ?? '';

    // Connect to the all messages channel
    _socketService.connectToMessagesHistoryChannel(accessToken);

    // Send the request to get all messages
    _socketService.sendMessageToMessagesHistoryChannel(
      Message(
        senderUserId: AuthSharedPrefs.getUserId() ?? -1,
        receiverDoctorId: receiverId,
      ),
    );

    // Listen to the all messages channel
    _socketService.listenToMessagesHistory((event) {
      final List<Message> messagesList =
          (jsonDecode(event) as List).map((e) => Message.fromJson(e)).toList();
      Logger().i(messagesList);
      onListen(messagesList);
    });

    // Close the all messages channel
    _socketService.closeMessagesHistoryChannel();
  }
}
