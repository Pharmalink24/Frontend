import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/main/chat/data/models/chat.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/messages/messages_header.dart';
import '../../../../core/di/dependency_injection.dart';
import '../logic/cubit/chat_cubit.dart';
import 'widgets/messages/message_input.dart';
import 'widgets/messages/messages_list_view.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class MessagesScreen extends StatefulWidget {
  final Chat chat;

  const MessagesScreen(
    this.chat, {
    super.key,
  });

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();

    // Todo: Check if this is the best place to initialize WebSocket
    // Initialize WebSocket for chat
    BlocProvider.of<ChatCubit>(context).listenToMessaging();
  }

  Widget _buildMessageInput(BuildContext context) {
    return MessageInput(
      controller: BlocProvider.of<ChatCubit>(context).messageController,
      onPressed: () =>
          context.read<ChatCubit>().sendMessage(widget.chat.chatWithId ?? -1),
    );
  }

  Widget _buildMessageListView(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // <-- Hide virtual keyboard
        },
        child: Align(
          alignment: Alignment.topCenter,
          child: MessagesListView(userId: widget.chat.chatWithId ?? -1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true, // assign true
        appBar: buildMessageAppBar(context, widget.chat),
        body: Column(
          children: [
            _buildMessageListView(context),
            _buildMessageInput(context),
          ],
        ),
      ),
    );
  }
}
