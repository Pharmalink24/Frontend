import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/shared/presentation/widgets/loading/loading_indicator.dart';
import 'package:pharmalink/features/app/chat/logic/cubit/chat_cubit.dart';
import 'package:pharmalink/features/app/chat/ui/widgets/messages/message_card.dart';
import '../../../data/models/message.dart';
import '../../../logic/cubit/chat_state.dart';

class MessagesListView extends StatefulWidget {
  final int userId;

  const MessagesListView({
    super.key,
    required this.userId,
  });

  @override
  State<MessagesListView> createState() => _MessagesListViewState();
}

class _MessagesListViewState extends State<MessagesListView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    setupScrollController(context);
    BlocProvider.of<ChatCubit>(context).retrieveChatMessages(widget.userId);
  }

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ChatCubit>(context)
              .retrieveChatMessages(widget.userId);
        }
      }
    });
  }

  Widget _buildMessagesList(
      BuildContext context, bool isLoading, List<Message> messages) {
    return ListView.separated(
      controller: scrollController,
      shrinkWrap: true,
      reverse: true,
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 16,
        bottom: 16,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        if (index < messages.length) {
          return MessageCard(messages[index]);
        } else {
          Timer(const Duration(milliseconds: 30), () {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          });

          return const LoadingIndicator();
        }
      },
      itemCount: messages.length + (isLoading ? 1 : 0),
    );
  }

  Widget _buildStream(BuildContext context, bool isLoading) {
    return StreamBuilder<dynamic>(
        stream: BlocProvider.of<ChatCubit>(context).getChattingStream(),
        builder: (context, snapshot) {
          final cubit = BlocProvider.of<ChatCubit>(context);
          final messages = cubit.messagesResponse;

          if (snapshot.hasData) {
            BlocProvider.of<ChatCubit>(context).receiveMessage(snapshot.data);
          }

          return _buildMessagesList(context, isLoading, messages);
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is AllMessagesReceivedLoading && state.isFirstFetch) {
          return const LoadingIndicator();
        } else {
          bool isLoading = false;
          if (state is AllMessagesReceivedLoading) {
            isLoading = true;
          } else if (state is AllMessagesReceivedSuccessfully) {
            isLoading = false;
          }

          return _buildStream(context, isLoading);
        }
      },
    );
  }
}
