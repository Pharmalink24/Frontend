import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/loading/loading_indicator.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/messages/message_card.dart';

import '../../../logic/cubit/chat_state.dart';

class MessagesContainer extends StatefulWidget {
  final int userId;

  const MessagesContainer({
    super.key,
    required this.userId,
  });

  @override
  State<MessagesContainer> createState() => _MessagesContainerState();
}

class _MessagesContainerState extends State<MessagesContainer> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ChatBloc>(context).add(GetMessages('${widget.userId}'));
  }

  Widget _buildMessagesList() {
    return BlocBuilder<ChatCubit, ChatState>(
      buildWhen: (previous, current) =>
          current is ConnectedSuccessfully ||
          current is SentSuccessfully ||
          current is ReceivedSuccessfully ||
          current is Loading,
      builder: (context, state) {
        if (state is Loading) {
          return const LoadingIndicator();
        } else if (state is ConnectedSuccessfully) {
          return Text(
            'Connected',
            style: AppTextStyle.headlineLarge(context),
          );
        } else {
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
                context.read<ChatCubit>().messages.reversed.toList()[index],
              );
            },
            itemCount: context.read<ChatCubit>().messages.length,
          );
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
          child: _buildMessagesList(),
        ),
      ),
    );
  }
}
