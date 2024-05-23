import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState<T> with _$ChatState<T> {
  const factory ChatState.initial() = _Initial;
 
  // Retrieve Chats
  const factory ChatState.chatsRetrievedLoading() = ChatsRetrievedLoading;
  const factory ChatState.chatsRetrieved(T data) = ChatsRetrieved<T>;
  const factory ChatState.chatsRetrievedError({required String error}) = ChatsRetrievedError;

  // Retrieve Chat Messages
  const factory ChatState.chatMessagesLoading() = ChatMessagesLoading;
  const factory ChatState.chatMessagesRetrieved(T data) = ChatMessagesRetrieved<T>;
  const factory ChatState.chatMessagesError({required String error}) = ChatMessagesError;

  // Send & Receive Messages
  const factory ChatState.messageReceived(T data) = MessageReceived<T>;
  const factory ChatState.messageSent(T data) = MessageSent<T>;
  const factory ChatState.messageFailed({required String error}) = MessageFailed;
}
