import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/features/main/chat/data/models/message.dart';
import 'package:pharmalink/features/main/chat/data/repo/chat_repo.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(const ChatState.initial());

  TextEditingController messageController = TextEditingController();
  final scrollController = ScrollController();
  Stream<dynamic>? messagesStream;

  Future<void> connect() async {
    // emit(const ChatState.loading());
    await _chatRepo.connectChat().then((stream) {
      messagesStream = stream;
    });

    messagesStream!.listen(
      (event) {
        Logger().i('Websocket connection established');
        Logger().i(event);
        final message = Message.fromJson(event);
        emit(ChatState.messageReceived(message));
      },
      onDone: () {
        Logger().i('Websocket connection closed');
      },
      onError: (error) {
        Logger().e('Websocket connection error: $error');
      },
    );
  }

  // // Retrieve all chats
  // Future<void> retrieveChats() async {
  //   emit(const ChatState.chatsRetrievedLoading());

  //   final chats = await _chatRepo.retrieveChats();
  //   emit(ChatState.chatsRetrieved(chats));
  // }

  // Retrieve all messages of a specific doctor
  Future<void> retrieveMessages(int doctorId) async {
    emit(const ChatState.chatMessagesLoading());

    final messagesListStream = await _chatRepo.retrieveMessages(doctorId);
    messagesListStream!.listen(
      (event) {
        Logger().i('Websocket connection established');
        Logger().i(event);

        // String to List of message objects
        final messages = List<Message>.from(
          event.map((message) => Message.fromJson(message)),
        );
        emit(ChatState.chatMessagesRetrieved(messages));
      },
      onDone: () {
        Logger().i('Websocket connection closed');
      },
      onError: (error) {
        Logger().e('Websocket connection error: $error');
      },
    );
  }

  Future<void> sendMessage(int doctorId) async {
    await _chatRepo.sendMessage(
      doctorId: doctorId,
      message: messageController.text,
    );

    afterSend();
  }

  void afterSend() {
    // Move the scroll position to the bottom
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    // Clear the message input field after sending the message
    messageController.text = '';
  }
}
