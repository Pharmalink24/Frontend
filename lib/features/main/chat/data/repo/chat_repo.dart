import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/networking/socket_channel.dart';
import '../../../../../core/networking/socket_constants.dart';
import '../models/chat.dart';
import '../models/message.dart';

enum ChannelType { allChats, chatting, allMessages }

class ChatRepo {
  final ApiService _apiService;
  ChatRepo(this._apiService);

  SocketChannel? messagingChannel;
  SocketChannel? messagesHistoryChannel;
  SocketChannel? userChatsChannel;

  // Socket
  Future<SocketChannel?> connectToChannel(ChannelType channelType) async {
    late String url;

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: AuthSharedPrefs.getAccessToken() ?? '',
    };

    if (channelType == ChannelType.allChats) {
      url =
          '${WebSocketConstants.wsDomain}${WebSocketConstants.allChatsChannel}';

      userChatsChannel = SocketChannel(
          () => IOWebSocketChannel.connect(url, headers: headers));

      Logger().i(
          'Connecting to channel with url: $url and headers: ${headers.toString()}');

      return userChatsChannel;
    } else if (channelType == ChannelType.allMessages) {
      url =
          '${WebSocketConstants.wsDomain}${WebSocketConstants.allMessagesChannel}';

      messagesHistoryChannel = SocketChannel(
          () => IOWebSocketChannel.connect(url, headers: headers));

      Logger().i(
          'Connecting to channel with url: $url and headers: ${headers.toString()}');

      return messagesHistoryChannel;
    } else {
      url = '${WebSocketConstants.wsDomain}${WebSocketConstants.chatChannel}';

      Map<String, dynamic> paths = {
        'user_id': AuthSharedPrefs.getUserId(),
      };

      // Replace the path parameters in the url
      url = url.replacePath(paths);

      messagingChannel = SocketChannel(
          () => IOWebSocketChannel.connect(url, headers: headers));

      Logger().i(
          'Connecting to channel with url: $url and headers: ${headers.toString()}');

      return messagingChannel;
    }
  }

  void disconnectFromChannel(ChannelType channelType) {
    if (channelType == ChannelType.allChats) {
      userChatsChannel?.close();
    } else if (channelType == ChannelType.allMessages) {
      messagesHistoryChannel?.close();
    } else {
      messagingChannel?.close();
    }
  }

  Future<void> listenToMessagingChannel(Function onListen) async {
    messagingChannel?.stream.listen(
      (event) {
        Logger().i('Received message: $event');
        onListen(event);
      },
      onError: (error) => Logger().e('Error in channel: $error'),
      onDone: () => Logger().i('Channel is closed'),
    );
  }

  Future<void> listenToMessagesHistory(
      int receiverDoctorId, Function onListen) async {
    messagesHistoryChannel ??= await connectToChannel(ChannelType.chatting);

    Message msg = Message(
      senderUserId: AuthSharedPrefs.getUserId(),
      receiverDoctorId: receiverDoctorId,
    );

    var message = jsonEncode(msg.toJson());
    Logger().i(
        'Sending message to get messages history: $message to channel: ${messagesHistoryChannel?.toString()}');
    messagesHistoryChannel?.sendMessage(message);

    messagesHistoryChannel?.stream.listen(
      (event) {
        Logger().i('Received messages: $event');
        onListen(event);
      },
      onError: (error) => Logger().e('Error in channel: $error'),
      onDone: () => Logger().i('Channel is closed'),
    );
  }

  Future<void> listenToUserChats(Function onListen) async {
    userChatsChannel?.stream.listen(
      (event) {
        Logger().i('Received chats: $event');
        onListen(event);
      },
      onError: (error) => Logger().e('Error in channel: $error'),
      onDone: () => Logger().i('Channel is closed'),
    );
  }

  Future<void> sendMessage(int receiverDoctorId, String message) async {
    messagingChannel ??= await connectToChannel(ChannelType.chatting);

    Message msg = Message(
      senderUserId: AuthSharedPrefs.getUserId(),
      receiverDoctorId: receiverDoctorId,
      message: message,
    );

    var messageJson = jsonEncode(msg.toJson());
    Logger().i(
        'Sending message: $messageJson to channel: ${messagingChannel?.toString()}');

    messagingChannel?.sendMessage(messageJson);
  }

  // Chats
  Future<ApiResult<Chat>> addChats(String id) async {
    try {
      final response =
          await _apiService.addChats(id, AuthSharedPrefs.getAccessToken());
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
