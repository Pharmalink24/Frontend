import 'package:bloc/bloc.dart';
import 'package:pharmalink/features/main/chat/data/repo/chat_repo.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  ChatCubit(this._chatRepo) : super(const ChatState.initial());
}
