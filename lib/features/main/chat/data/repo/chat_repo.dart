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

enum ChannelType { allChats, messages }

class ChatRepo {
  final ApiService _apiService;
  ChatRepo(this._apiService);

  SocketChannel? channel;

  // Socket
  Future<SocketChannel?> connectToChannel(ChannelType channelType) async {
    late String url;

    if (channelType == ChannelType.allChats) {
      url = '${WebSocketConstants.wsDomain}${WebSocketConstants.allChatsChannel}';
    } else {
      url = '${WebSocketConstants.wsDomain}${WebSocketConstants.chatChannel}';

      Map<String, dynamic> paths = {
        'user_id': AuthSharedPrefs.getUserId(),
      };

      // Replace the path parameters in the url
      url = url.replacePath(paths);
    }

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: AuthSharedPrefs.getAccessToken() ?? '',
    };

    Logger().i(
        'Connecting to channel with url: $url and headers: ${headers.toString()}');

    channel =
        SocketChannel(() => IOWebSocketChannel.connect(url, headers: headers));

    return channel;
  }

  Future<void> listenToChannel(Function onListen) async {
    channel?.stream.listen(
      (event) {
        Logger().i('Received message: $event');
        onListen(event);
      },
      onError: (error) => Logger().e('Error in channel: $error'),
      onDone: () => Logger().i('Channel is closed'),
    );
  }

  Future<List<Message>> getMessagesHistory(String id) async {
    return [];
  }

  Future<void> sendMessage(Message msg) async {
    Logger().i(
        'Sending message: ${jsonEncode(msg.toJson())} to channel: ${channel.toString()}');
    channel ??= await connectToChannel(ChannelType.messages);

    channel?.sendMessage(jsonEncode(msg.toJson()));
  }

  Future<void> getUserChats(Function onListen) async {
    channel?.stream.listen(
      (event) {
        Logger().i('Received chats: $event');
        onListen(event);
      },
      onError: (error) => Logger().e('Error in channel: $error'),
      onDone: () => Logger().i('Channel is closed'),
    );
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
