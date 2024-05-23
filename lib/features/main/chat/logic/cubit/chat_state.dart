import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;

  // Connect to the channels
  const factory ChatState.connectedLoading() = ConnectedLoading;
  const factory ChatState.connectedSuccessfully() = ConnectedSuccessfully;
  const factory ChatState.connectedError(String message) = ConnectedError;

  // Send a message
  const factory ChatState.messageSentLoading() = MessageSentLoading;
  const factory ChatState.messageSentSuccessfully() = MessageSentSuccessfully;
  const factory ChatState.messageSentError(String message) = MessageSentError;

  // Get all chats
  const factory ChatState.userChatsReceivedLoading() = UserChatsReceivedLoading;
  const factory ChatState.userChatsReceivedSuccessfully() =
      UserChatsReceivedSuccessfully;
  const factory ChatState.userChatsReceivedError(String message) =
      UserChatsReceivedError;

  // Get all messages
  const factory ChatState.allMessagesReceivedLoading() =
      AllMessagesReceivedLoading;
  const factory ChatState.allMessagesReceivedSuccessfully() =
      AllMessagesReceivedSuccessfully;
  const factory ChatState.allMessagesReceivedError(String message) =
      AllMessagesReceivedError;
}
