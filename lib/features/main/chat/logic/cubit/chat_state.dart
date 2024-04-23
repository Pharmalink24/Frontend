import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState<T> with _$ChatState<T> {
  const factory ChatState.initial() = _Initial;

  // Chats
  const factory ChatState.chatsRetrievedLoading() = ChatsRetrievedLoading;
  const factory ChatState.chatsRetrieved(T data) = ChatsRetrieved<T>;
  const factory ChatState.chatsRetrievedError({required String error}) = ChatsRetrievedError;

  // Chat Messages
  const factory ChatState.chatMessagesLoading() = ChatMessagesLoading;
  const factory ChatState.chatMessagesRetrieved(T data) = ChatMessagesRetrieved<T>;
  const factory ChatState.chatMessagesError({required String error}) = ChatMessagesError;
}
