import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/message.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState<T> with _$ChatState<T> {
  const factory ChatState.initial() = _Initial;

  // Connect to the channels
  const factory ChatState.connectedLoading() = ConnectedLoading;
  const factory ChatState.connectedSuccessfully() = ConnectedSuccessfully;
  const factory ChatState.connectedError(String message) = ConnectedError;

  // Get user chats
  const factory ChatState.userChatsReceivedLoading() = UserChatsReceivedLoading;
  const factory ChatState.userChatsReceivedSuccessfully(T chats) =
      UserChatsReceivedSuccessfully<T>;
  const factory ChatState.userChatsReceivedError(String message) =
      UserChatsReceivedError;

  // Send a message
  const factory ChatState.messageSentLoading() = MessageSentLoading;
  const factory ChatState.messageSentSuccessfully() = MessageSentSuccessfully;
  const factory ChatState.messageSentError(String message) = MessageSentError;

  // Get all messages
  const factory ChatState.allMessagesReceivedLoading(
      List<Message> messages, bool isFirstFetch) = AllMessagesReceivedLoading;
  const factory ChatState.allMessagesReceivedSuccessfully(
      List<Message> messages) = AllMessagesReceivedSuccessfully;
  const factory ChatState.allMessagesReceivedError(String message) =
      AllMessagesReceivedError;
}
