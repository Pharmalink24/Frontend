import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading/loading_indicator.dart';
import 'package:pharmalink/features/main/chat/data/models/chats_response.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/all_chats/all_chats_header.dart';
import '../data/models/chat.dart';
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

    // Listen to messaging
    BlocProvider.of<ChatCubit>(context).retrieveUserChats();

    // Todo: Check if this is the best place to initialize WebSocket
    // Initialize WebSocket for chat
    BlocProvider.of<ChatCubit>(context).listenToMessaging();
  }

  Widget _buildEmptyChats() {
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
            AppLocalizations.of(context).translate('noChats'),
            style: AppTextStyle.headlineMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            AppLocalizations.of(context).translate('noChatsDescription'),
            style: AppTextStyle.bodyMedium(context).copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChatsList(List<Chat> chats) {
    return ListView.builder(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
      itemBuilder: (context, index) {
        return ChatCard(
          chats[index],
        );
      },
      itemCount: chats.length,
    );
  }

  Widget buildChats() {
    return Expanded(
      child: BlocBuilder<ChatCubit, ChatState>(
        buildWhen: (previous, current) =>
            current is UserChatsReceivedSuccessfully,
        builder: (context, state) {
          if (state is UserChatsReceivedSuccessfully) {
            final response = state.chats as ChatsResponse;
            if (response.userChats.isEmpty) {
              return _buildEmptyChats();
            } else {
              return _buildChatsList(response.userChats);
            }
          } else {
            return const LoadingIndicator();
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
