import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/main/chat/data/models/chat.dart';
import 'package:pharmalink/features/main/chat/data/repo/chat_repo.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/messages/messages_header.dart';
import '../data/models/message.dart';
import '../logic/cubit/chat_cubit.dart';
import 'widgets/messages/message_input.dart';
import 'widgets/messages/messages_container.dart';

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
    context.read<ChatCubit>().connect(ChannelType.messages);
    context.read<ChatCubit>().listenToMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // assign true
      appBar: buildMessageAppBar(context, widget.chat),
      body: SafeArea(
        child: Column(
          children: [
            MessagesContainer(userId: widget.chat.doctorId),
            MessageInput(
              controller: context.read<ChatCubit>().controller,
              onPressed: () =>
                  context.read<ChatCubit>().sendMessage(widget.chat.doctorId),
            ),
          ],
        ),
      ),
    );
  }
}
