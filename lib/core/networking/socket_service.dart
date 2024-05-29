import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/networking/socket_constants.dart';
import 'package:web_socket_channel/io.dart';

import '../../features/main/chat/data/models/message.dart';
import 'socket_channel.dart';

class SocketService {
  // Base URL
  String baseUrl = WebSocketConstants.wsDomain;

  SocketService();

  SocketChannel? _messagingChannel;
  SocketChannel? _userChatsChannel;

  Map<String, String> getHeaders(String auth) => {
        HttpHeaders.authorizationHeader: auth,
      };

  String setPathParams(String url, Map<String, dynamic> paths) {
    return url.replacePath(paths);
  }

  //-------------------- Connect/Close Socket Channels --------------------//

  // Connect to all channels
  void connectToAllChannels(int currentUserId, String auth) {
    connectToMessagingChannel(currentUserId, auth);
    connectToUserChatsChannel(auth);
  }

  // Close all channels
  void closeAllChannels() {
    _messagingChannel?.close();
    _userChatsChannel?.close();
  }

  //-------------------- Messaging Channel --------------------//

  // Connect to the messaging channel
  SocketChannel connectToMessagingChannel(int currentUserId, String auth) {
    // Get the headers
    Map<String, String> headers = getHeaders(auth);
    // Construct the url
    String url = '$baseUrl${WebSocketConstants.messagingChannel}';
    // Replace the path parameters in the url
    url = setPathParams(url, {'user_id': currentUserId});

    // Log the url and headers
    Logger().i('url: $url');
    Logger().i('headers: $headers');

    // Connect to the messaging channel
    _messagingChannel = SocketChannel(
      () => IOWebSocketChannel.connect(
        Uri.parse(url),
        headers: headers,
      ),
    );

    return _messagingChannel!;
  }

  // Close the messaging channel
  void closeMessagingChannel() {
    _messagingChannel?.close();
    Logger().i('Messaging Channel is closed');
  }

  //-------------------- User Chats Channel --------------------//

  // Connect to the user chats channel
  SocketChannel connectToUserChatsChannel(String auth) {
    // Get the headers
    Map<String, String> headers = getHeaders(auth);

    // Construct the url
    String url = '$baseUrl${WebSocketConstants.allChatsChannel}';

    // Log the url and headers
    Logger().i('url: $url');
    Logger().i('headers: $headers');

    // Connect to the messaging channel
    _userChatsChannel = SocketChannel(
      () => IOWebSocketChannel.connect(
        Uri.parse(url),
        headers: headers,
      ),
    );

    return _userChatsChannel!;
  }

  // Close the user chats channel
  void closeUserChatsChannel() {
    _userChatsChannel?.close();
    Logger().i('User Chats Channel is closed');
  }

  //-------------------- Listen to Channels --------------------//

  // Listen to the messaging channel
  void listenToMessagingChannel(Function onListen) {
    _messagingChannel?.stream.listen(
      (event) {
        Logger().i('Received message: $event');
        onListen(event);
      },
      onError: (error) => Logger().e('Error in messaging channel: $error'),
      onDone: () => Logger().i('Messaging Channel is closed'),
    );
  }

  // Listen to the user chats channel
  void listenToUserChats(Function onListen) {
    _userChatsChannel?.stream.listen(
      (event) {
        Logger().i('Received chats: $event');
        onListen(event);
      },
      onError: (error) => Logger().e('Error in user chats channel: $error'),
      onDone: () => Logger().i('User chats Channel is closed'),
    );
  }

  //-------------------- Send Messages --------------------//

  // Send message to the messaging channel
  void sendMessageToMessagingChannel(Message message) {
    Logger().i('Sending message: ${message.toJson()}');

    // Convert the message to json
    final messageJson = jsonEncode(message.toJson());

    // Send the message
    _messagingChannel?.sendMessage(messageJson);
  }

  // Retrieve the chatting stream
  Stream<dynamic>? getChattingStream() {
    return _messagingChannel?.stream;
  }

  // Retrieve the user chats stream
  Stream<dynamic>? getUserChatsStream() {
    return _userChatsChannel?.stream;
  }
}
