import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/models/timestamp.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/main/chat/data/models/message.dart';
import 'package:pharmalink/features/main/chat/data/repo/chat_repo.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(const ChatState.initial());

  TextEditingController messageController = TextEditingController();
  final scrollController = ScrollController();

  Future<void> sendMessage(int receiverDoctorId) async {
    // emit(const ChatState.loading());
    await _chatRepo.sendMessage(
      Message(
        id: 1,
        senderUserId: AuthSharedPrefs.getUserId(),
        receiverDoctorId: receiverDoctorId,
        message: messageController.text,
        timestamp: Timestamp(date: DateTime.now().toString()),
      ),
    );

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
