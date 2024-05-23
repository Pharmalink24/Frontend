import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/all_chats/all_chats_header.dart';

import '../data/models/chat.dart';
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
  }

  Widget buildChats() {
    return Expanded(
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            itemBuilder: (context, index) {
              return ChatCard(
                context.read<ChatCubit>().chatsResponse.userChats[index],
              );
            },
            itemCount: context.read<ChatCubit>().chatsResponse.userChats.length,
          );
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
