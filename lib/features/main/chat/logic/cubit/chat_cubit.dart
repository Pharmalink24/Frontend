import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/errors.dart';
import '../../data/models/message.dart';
import '../../data/repo/chat_repo.dart';
import 'chat_state.dart';

const _kNumberOfMessagesPerRequest = 15;

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(const ChatState.initial());

  // Message Input Controller
  TextEditingController messageController = TextEditingController();

  // Current page number
  int currentPage = 1;

  // Is current page is last
  bool isLast = false;

  // List of messages
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
  void retrieveChatMessages(int receiverDoctorId) async {
    // Emit loading state
    if (state is AllMessagesReceivedLoading) return;

    final currentState = state;

    if (currentState is AllMessagesReceivedSuccessfully) {
      messagesResponse = List.from(currentState.messages);
    }

    if (isLast) return;

    emit(
      ChatState.allMessagesReceivedLoading(messagesResponse, currentPage == 0),
    );

    // Retrieve all messages
    final response = await _chatRepo.retrieveAllMessages(
      receiverDoctorId,
      pageNumber: currentPage,
      pageSize: _kNumberOfMessagesPerRequest,
    );

    response.when(
      success: (messagesHistoryResponse) {
        // Increase current page number
        currentPage++;

        // Is the current page last
        isLast = currentPage > messagesHistoryResponse.pages;

        // Add messages to Messages list
        messagesResponse =
            List<Message>.from((state as AllMessagesReceivedLoading).messages).reversed.toList();
        messagesResponse.addAll(messagesHistoryResponse.messages);

        // Update the UI
        emit(ChatState.allMessagesReceivedSuccessfully(messagesResponse));
      },
      failure: (error) {
        // Update the UI
        emit(
          ChatState.allMessagesReceivedError(
            error.apiErrorModel.error ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  // Retrieve user chats
  void retrieveUserChats() {
    _chatRepo.retrieveUserChats(
      (chats) {
        // Loading state
        emit(const ChatState.userChatsReceivedLoading());

        // Update the UI
        emit(ChatState.userChatsReceivedSuccessfully(chats));
      },
    );
  }

  // Send message to the chat channel
  void sendMessage(int receiverDoctorId) {
    if (messageController.text.isNotEmpty) {
      // Create the message
      _chatRepo.sendMessageToMessagingChannel(
          receiverDoctorId, messageController.text);

      // Clear the input field
      messageController.clear();
    }
  }

  // Dispose
  void dispose() {
    messageController.dispose();
    super.close();
  }
}
