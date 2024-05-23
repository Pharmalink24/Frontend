import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/message.dart';
import '../../logic/cubit/chat_cubit.dart';
import '../../logic/cubit/chat_state.dart';
import 'message_card.dart';

class MessagesContainer extends StatefulWidget {
  const MessagesContainer({super.key});

  @override
  State<MessagesContainer> createState() => _MessagesContainerState();
}

class _MessagesContainerState extends State<MessagesContainer> {
  List<Message> messages = [];

  BlocListener buildSendReceiveBlocListener() {
    return BlocListener<ChatCubit, ChatState>(
      listenWhen: (previous, current) =>
          current is MessageReceived ||
          current is MessageSent ||
          current is MessageFailed,
      listener: (context, state) {
        if (state is MessageReceived) {
          Message message = state.data;
          messages.add(message);
        } else if (state is MessageSent) {
          Message message = state.data;
          messages.add(message);
        } else if (state is MessageFailed) {
          messages.add(
            Message(
              success: false,
            ),
          );
        }
      },
    );
  }

  Widget buildMessagesList() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // <-- Hide virtual keyboard
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          controller: context.read<ChatCubit>().scrollController,
          shrinkWrap: true,
          reverse: true,
          padding: const EdgeInsetsDirectional.only(
            start: 16,
            end: 16,
            top: 16,
            bottom: 16,
          ),
          itemBuilder: (context, index) {
            if (messages.reversed.toList()[index].success == true) {
              return MessageCard(
                messages.reversed.toList()[index],
              );
            } else {
              return const MessageCard(
                null,
                isErrorMessage: true,
              );
            }
          },
          itemCount: messages.length,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          buildMessagesList(),
          // buildSendReceiveBlocListener(),
        ],
      ),
    );
  }
}
