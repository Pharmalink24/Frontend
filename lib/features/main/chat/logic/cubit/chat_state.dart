import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;

  const factory ChatState.loading() = Loading;

  const factory ChatState.connectedSuccessfully() = ConnectedSuccessfully;
  const factory ChatState.sentSuccessfully() = SentSuccessfully;
  const factory ChatState.receivedSuccessfully() = ReceivedSuccessfully;
  const factory ChatState.userChatsReceivedSuccessfully() =
      UserChatsReceivedSuccessfully;

  const factory ChatState.error(String message) = Error;
}
