import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/features/main/chat/data/models/chats_response.dart';
import '../../data/models/message.dart';
import '../../data/repo/chat_repo.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(const ChatState.initial());

  // Controller
  TextEditingController controller = TextEditingController();

  // List
  List<Message> messagesResponse = [];

  // Listen to the messaging channel
  void listenToMessaging() {
    // Listen to the messaging channel
    _chatRepo.messaging((message) {
      // Retrieve the user chats
      retrieveUserChats();

      // Add the message to the list
      messagesResponse.add(message);

      // Update the UI
      emit(const ChatState.messageSentSuccessfully());
    });
  }

  // Get all messages
  void retrieveChatMessages(int receiverDoctorId) {
    // Retrieve all messages
    _chatRepo.retrieveAllMessages(receiverDoctorId, (messages) {
      // Update the UI
      emit(ChatState.allMessagesReceivedSuccessfully(messages));
    });
  }

  // Retrieve user chats
  void retrieveUserChats() {
    // Retrieve the user chats
    // Listen to the user chats channel

    _chatRepo.retrieveUserChats().stream.listen(
      (event) {
        // Loading state
        emit(const ChatState.userChatsReceivedLoading());

        // Convert the event to json
        final ChatsResponse chats = ChatsResponse.fromJson(jsonDecode(event));
        // Update the UI
        emit(ChatState.userChatsReceivedSuccessfully(chats));
      },
    );
  }

  // Send message to the chat channel
  void sendMessage(int receiverDoctorId) {
    if (controller.text.isNotEmpty) {
      // Create the message
      _chatRepo.sendMessageToMessagingChannel(
          receiverDoctorId, controller.text);

      // Clear the input field
      controller.clear();
    }
  }

  // Dispose
  void dispose() {
    controller.dispose();
    super.close();
  }
}
