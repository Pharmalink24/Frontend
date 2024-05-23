import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/models/timestamp.dart';
import 'package:pharmalink/core/networking/socket_channel.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import '../../data/models/chat.dart';
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
    emit(const ChatState.loading());

    // Connect
    channel = await _chatRepo.connectToChannel(socketChannel);

    // Connected Successfully
    emit(const ChatState.connectedSuccessfully());
  }

  void listenToMessage() {
    _chatRepo.listenToChannel((event) {
      emit(const ChatState.loading());

      Message receivedMsg = Message.fromJson(jsonDecode(event));

      // Add the message to the list
      messages.add(
        Message(
          message: receivedMsg.message,
          isDelivered: receivedMsg.isDelivered,
        ),
      );
      // Update the UI
      emit(const ChatState.receivedSuccessfully());
    });
  }

  // Send message to the chat channel
  void sendMessage(int receiverDoctorId) {
    if (controller.text.isNotEmpty) {
      emit(const ChatState.loading());

      Message msg = Message(
        message: controller.text,
        senderUserId: AuthSharedPrefs.getUserId(),
        receiverDoctorId: receiverDoctorId,
        timestamp: Timestamp(date: DateTime.now().format('hh:mm a')),
      );

      _chatRepo.sendMessage(msg);

      // Add the message to the list
      messages.add(msg);
      // Clear the input field
      controller.clear();
      // Message Sent Successfully
      emit(const ChatState.sentSuccessfully());
    }
  }

  void getUserChats() {
    _chatRepo.getUserChats((event) {
      emit(const ChatState.loading());

      chatsResponse = ChatsResponse.fromJson(jsonDecode(event));

      // Update the UI
      emit(const ChatState.userChatsReceivedSuccessfully());
    });
  }

  void dispose() {
    controller.dispose();
    channel?.close();
    super.close();
  }
}
