import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/features/main/chat/data/models/messages_history_response.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/messages/message_card.dart';
import '../../../../../core/helpers/errors.dart';
import '../../data/models/message.dart';
import '../../data/repo/chat_repo.dart';
import 'chat_state.dart';

const _kPageSize = 20;

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(const ChatState.initial());

  // Message Input Controller
  TextEditingController messageController = TextEditingController();

  // Messages pagination controller
  final PagingController<int, Message> pagingController =
      PagingController(firstPageKey: 0);

  int lastPage = 0;

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
  void retrieveChatMessages(
    int receiverDoctorId, {
    int pageKey = 0,
  }) async {
    // Retrieve all messages
    final response = await _chatRepo.retrieveAllMessages(
      receiverDoctorId,
      pageNumber: pageKey,
      pageSize: _kPageSize,
    );

    response.when(
      success: (newPage) {
        final previouslyFetchedItemsCount =
            pagingController.itemList?.length ?? 0;

        final isLastPage = newPage.isLastPage(previouslyFetchedItemsCount);
        final newItems = newPage.messages;

        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(newItems, nextPageKey);
        }

        // Update the UI
        emit(const ChatState.allMessagesReceivedSuccessfully());
      },
      failure: (error) {
        // Paging controller error
        pagingController.error = error;

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
    pagingController.dispose();
    super.close();
  }
}
