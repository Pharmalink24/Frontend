import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/messages/message_card.dart';
import '../../../../../../core/widgets/loading/empty_list_indicator.dart';
import '../../../../../../core/widgets/loading/error_indicator.dart';
import '../../../data/models/message.dart';
import '../../../logic/cubit/chat_state.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
  @override
  void initState() {
    BlocProvider.of<ChatCubit>(context).retrieveChatMessages(widget.userId);

    super.initState();
  }

  Widget _buildMessagesList(List<Message> messages) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => context.read<ChatCubit>().pagingController.refresh(),
      ),
      child: PagedListView.separated(
        reverse: true,
        shrinkWrap: true,
        pagingController: context.read<ChatCubit>().pagingController,
        padding: const EdgeInsetsDirectional.only(
          start: 16,
          end: 16,
          top: 16,
          bottom: 16,
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        builderDelegate: PagedChildBuilderDelegate<Message>(
          itemBuilder: (context, message, index) => MessageCard(message),
          firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
            error: context.read<ChatCubit>().pagingController.error,
            onTryAgain: () =>
                context.read<ChatCubit>().pagingController.refresh(),
          ),
          noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      buildWhen: (previous, current) =>
          current is MessageSentSuccessfully ||
          current is AllMessagesReceivedSuccessfully ||
          current is MessageSentLoading ||
          current is AllMessagesReceivedLoading,
      builder: (context, state) {
        if (state is AllMessagesReceivedSuccessfully ||
            state is MessageSentSuccessfully) {
          return _buildMessagesList(context.read<ChatCubit>().messagesResponse);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
