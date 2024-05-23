import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading/loading_indicator.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/all_chats/all_chats_header.dart';
import '../data/repo/chat_repo.dart';
import '../logic/cubit/chat_state.dart';
import 'widgets/all_chats/chat_card.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ChatCubit>().connect(ChannelType.allChats);
    context.read<ChatCubit>().getUserChats();

    context.read<ChatCubit>().connect(ChannelType.chatting);
    context.read<ChatCubit>().listenToMessaging();
  }

  Widget buildChats() {
    return Expanded(
      child: BlocBuilder<ChatCubit, ChatState>(
        buildWhen: (previous, current) =>
            current is UserChatsReceivedSuccessfully ||
            current is UserChatsReceivedError ||
            current is UserChatsReceivedLoading,
        builder: (context, state) {
          if (state is UserChatsReceivedError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            if (context.read<ChatCubit>().chatsResponse.userChats.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 82,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'No Chats',
                      style: AppTextStyle.headlineMedium(context).copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Start a new chat with a doctor',
                      style: AppTextStyle.bodyMedium(context).copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    )
                  ],
                ),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                itemBuilder: (context, index) {
                  return ChatCard(
                    context.read<ChatCubit>().chatsResponse.userChats[index],
                  );
                },
                itemCount:
                    context.read<ChatCubit>().chatsResponse.userChats.length,
              );
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const ChatsHeader(),
          buildChats(),
        ],
      ),
    );
  }
}
