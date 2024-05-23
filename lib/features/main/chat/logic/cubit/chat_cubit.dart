import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/socket_channel.dart';
import '../../data/models/chats_response.dart';
import '../../data/models/message.dart';
import '../../data/repo/chat_repo.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(const ChatState.initial());

  // Controller
  TextEditingController controller = TextEditingController();

  // List
  List<Message> messages = [];
  ChatsResponse chatsResponse = ChatsResponse(userChats: []);

  // Socket Channel
  SocketChannel? channel;

  // Connect to the chat channel
  void connect(ChannelType socketChannel) async {
    emit(const ChatState.connectedLoading());

    // Connect
    channel = await _chatRepo.connectToChannel(socketChannel);

    // Connected Successfully
    emit(const ChatState.connectedSuccessfully());
  }

  // Disconnect from the chat channel
  void disconnect(ChannelType socketChannel) {
    _chatRepo.disconnectFromChannel(socketChannel);
  }

  void listenToMessaging() {
    _chatRepo.listenToMessagingChannel((event) {
      disconnect(ChannelType.allChats);
      connect(ChannelType.allChats);
      getUserChats();

      emit(const ChatState.messageSentLoading());

      Message receivedMsg = Message.fromJson(jsonDecode(event));

      // Add the message to the list
      messages.add(
        Message(
          message: receivedMsg.message,
          senderUserId: receivedMsg.senderUserId,
          receiverUserId: receivedMsg.receiverUserId,
          senderDoctorId: receivedMsg.senderDoctorId,
          receiverDoctorId: receivedMsg.receiverDoctorId,
          timestamp: receivedMsg.timestamp,
          isDelivered: receivedMsg.isDelivered,
        ),
      );

      // Update the UI
      emit(const ChatState.messageSentSuccessfully());
    });
  }

  void getChatMessages(int receiverDoctorId) {
    _chatRepo.listenToMessagesHistory(receiverDoctorId, (event) {
      emit(const ChatState.allMessagesReceivedLoading());

      Logger().i(
          'Received messages type: ${(jsonDecode(event) as List).runtimeType}');
      // Parse the event (String of List of messages)
      messages = (jsonDecode(event) as List).map((e) {
        return Message.fromJson(e);
      }).toList();

      // Update the UI
      emit(const ChatState.allMessagesReceivedSuccessfully());
    });
  }

  void getUserChats() {
    // Loading
    emit(const ChatState.userChatsReceivedLoading());

    _chatRepo.listenToUserChats(
      (event) {
        // Parse the response
        chatsResponse = ChatsResponse.fromJson(jsonDecode(event));

        // Update the UI
        emit(const ChatState.userChatsReceivedSuccessfully());
      },
    );
  }

  // Send message to the chat channel
  void sendMessage(int receiverDoctorId) {
    if (controller.text.isNotEmpty) {
      // Create the message
      _chatRepo.sendMessage(receiverDoctorId, controller.text);

      // Clear the input field
      controller.clear();
    }
  }

  void dispose() {
    controller.dispose();
    channel?.close();
    super.close();
  }
}
