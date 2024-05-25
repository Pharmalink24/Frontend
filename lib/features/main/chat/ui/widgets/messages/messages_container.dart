import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/widgets/loading/loading_indicator.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/messages/message_card.dart';

import '../../../data/models/message.dart';
import '../../../logic/cubit/chat_state.dart';

class MessagesContainer extends StatelessWidget {
  final int userId;

  const MessagesContainer({
    super.key,
    required this.userId,
  });

  Widget _buildMessagesList(List<Message> messages) {
    return ListView.builder(
      reverse: true,
      shrinkWrap: true,
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 16,
        bottom: 16,
      ),
      itemBuilder: (context, index) {
        return MessageCard(
          messages.reversed.toList()[index],
        );
      },
      itemCount: messages.length,
    );
  }

  Widget _buildMessagesWidget() {
    return BlocBuilder<ChatCubit, ChatState>(
      buildWhen: (previous, current) =>
          current is MessageSentSuccessfully ||
          current is AllMessagesReceivedSuccessfully ||
          current is MessageSentLoading ||
          current is AllMessagesReceivedLoading,
      builder: (context, state) {
        if (state is AllMessagesReceivedSuccessfully) {
          return _buildMessagesList(state.messages);
        } else if (state is MessageSentSuccessfully) {
          return _buildMessagesList(context.read<ChatCubit>().messagesResponse);
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // <-- Hide virtual keyboard
        },
        child: Align(
          alignment: Alignment.topCenter,
          child: _buildMessagesWidget(),
        ),
      ),
    );
  }
}
